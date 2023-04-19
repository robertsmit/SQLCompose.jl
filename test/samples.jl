

#All flights are operated by several types of aircraft:
@testsql Bookings.query_aircrafts() "SELECT a.aircraft_code, a.model, a.range FROM aircrafts a"
#For each aircraft type, a separate list of seats is supported. For example, in a small Cessna 208 Caravan, one can select the following seats:
@testsql begin
    Bookings.query_aircrafts() |>
    filter(a -> a.model == "Cessna 208 Caravan") |>
    join(Bookings.query_seats(), :aircraft_code) |>
    map((a, s) -> (; a.aircraft_code, a.model, s.seat_no, s.fare_conditions)) |>
    sort(:seat_no)
end,
"SELECT a.aircraft_code, a.model, s.seat_no, s.fare_conditions FROM aircrafts a 
    INNER JOIN seats s ON a.aircraft_code = s.aircraft_code 
    WHERE a.model = 'Cessna 208 Caravan' ORDER BY s.seat_no"

#Bigger aircraft have more seats of various travel classes:
@testsql begin
    seats_fare_condition_nums = Bookings.query_seats() |>
                                groupby(:aircraft_code, :fare_conditions) |>
                                sort(:aircraft_code, :fare_conditions) |>
                                map(s -> (; s.aircraft_code, s.fare_conditions, num=count()))
    query(seats_fare_condition_nums) |>
    groupby(:aircraft_code) |>
    sort(:aircraft_code) |>
    map(r -> (; r.aircraft_code,
        fare_conditions=join(r.fare_conditions * "(" * convert(TextType(), r.num) * ")", ", ")))
end,
"SELECT q.aircraft_code, string_agg(CONCAT(q.fare_conditions, '(', q.num::text, ')'), ', ') AS fare_conditions 
FROM (SELECT s.aircraft_code, s.fare_conditions, count(*) AS num 
        FROM seats s 
        GROUP BY s.aircraft_code, s.fare_conditions 
        ORDER BY s.aircraft_code, s.fare_conditions) q 
GROUP BY q.aircraft_code 
ORDER BY q.aircraft_code"

#Which flight segments are included into Antonina Kuznecova's ticket
@testsql begin
    flights_v_of(ticket_flights::Bookings.Ticket_FlightsRow) = SQLCompose.lateral(Bookings.Flights_VRow, :flight_id, ticket_flights.flight_id)
    Bookings.query_ticket_flights() |>
    map(tf -> (; tf, f=flights_v_of(tf))) |>
    sort(((; f),) -> f.scheduled_departure) |>
    filter(((; tf),) -> tf.ticket_no == "0005432661915") |>
    map(((tf, f),) -> (
        when=string(f.scheduled_departure; pattern="DD.MM.YYYY"),
        departure=string(f.departure_city, " (", f.departure_airport, ")"),
        arrival=string(f.arrival_city, " (", f.arrival_airport, ")"),
        class=tf.fare_conditions,
        tf.amount
        ))
end,
"SELECT 
    to_char(lat_flights_v.scheduled_departure, 'DD.MM.YYYY') AS when, 
    CONCAT(lat_flights_v.departure_city, ' (', lat_flights_v.departure_airport, ')') AS departure, 
    CONCAT(lat_flights_v.arrival_city, ' (', lat_flights_v.arrival_airport, ')') AS arrival, 
    t.fare_conditions AS class, 
    t.amount 
FROM ticket_flights t 
    INNER JOIN flights_v lat_flights_v ON t.flight_id = lat_flights_v.flight_id 
WHERE t.ticket_no = '0005432661915' 
ORDER BY lat_flights_v.scheduled_departure"