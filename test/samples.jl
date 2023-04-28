

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
    flights_v_of(ticket_flights::Bookings.Ticket_FlightsRow) = SQLCompose.reference(Bookings.Flights_VRow, :flight_id, ticket_flights.flight_id)
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
    to_char(ref_flights_v.scheduled_departure, 'DD.MM.YYYY') AS when, 
    CONCAT(ref_flights_v.departure_city, ' (', ref_flights_v.departure_airport, ')') AS departure, 
    CONCAT(ref_flights_v.arrival_city, ' (', ref_flights_v.arrival_airport, ')') AS arrival, 
    t.fare_conditions AS class, 
    t.amount 
FROM ticket_flights t 
    INNER JOIN flights_v ref_flights_v ON t.flight_id = ref_flights_v.flight_id 
WHERE t.ticket_no = '0005432661915' 
ORDER BY ref_flights_v.scheduled_departure"

#Retrieve the film title along with the first name and last name of up to 3 actors associated with each film
@testsql begin
    Pagila.query_film() |>
    join_lateral(f -> begin
            Pagila.query_film_actor() |>
            filter(fa -> fa.film_id == f.film_id) |>
            map(fa -> (; Pagila.actor_of(fa).first_name, Pagila.actor_of(fa).last_name)) |>
            q -> q[1:3]
        end, type=LeftJoin()) |>
    map((f, a) -> (; f.title, a.first_name, a.last_name))
end,
"SELECT f.title, q.first_name, q.last_name 
    FROM film f 
    LEFT JOIN LATERAL (SELECT ref_actor.first_name, ref_actor.last_name 
                FROM film_actor f2 
                INNER JOIN actor ref_actor ON f2.actor_id = ref_actor.actor_id 
                WHERE f2.film_id = f.film_id 
                LIMIT 3) q ON true"


                

#                 SELECT c.customer_id, c.first_name, c.last_name, r.total_revenue
# FROM customer c
#  JOIN LATERAL (
#   SELECT customer_id, SUM(amount) AS total_revenue
#   FROM payment
#   WHERE customer_id = c.customer_id
#   GROUP BY customer_id
# ) AS r ON r.total_revenue > 100 -- Example condition
# ORDER BY r.total_revenue desc
# LIMIT 10;