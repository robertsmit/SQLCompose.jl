

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





# In this example, we use a LATERAL join to join the customer table 
#     with a subquery that selects the rental_id, inventory_id, 
#     and rental_duration for each film rental associated with the customer_id from the outer query. 
#     We then calculate the rental cost by multiplying the rental_duration and rental_rate for each film.
@testsql Pagila.query_customer() |>
         join_lateral(c -> Pagila.query_rental() |>
                           filter(r -> r.customer_id == c.customer_id) |>
                           map(r -> (; r.rental_id, r.inventory_id))) |>
         join_lateral((c, r) -> Pagila.query_film() |>
                                filter(f -> Pagila.all_inventory_of(f).inventory_id == r.inventory_id) |>
                                map(f -> (; f.title, f.rental_rate, f.rental_duration))) |>
         map((c, r, f) -> (; c.customer_id, f.title, f.rental_rate, rental_cost=f.rental_duration * f.rental_rate)),
"SELECT c.customer_id, q2.title, q2.rental_rate, q2.rental_duration * q2.rental_rate AS rental_cost 
    FROM customer c 
    INNER JOIN LATERAL (SELECT r.rental_id, r.inventory_id 
                        FROM rental r 
                        WHERE r.customer_id = c.customer_id) q 
        ON true 
    INNER JOIN LATERAL (SELECT f.title, f.rental_rate, f.rental_duration 
                        FROM film f
                        INNER JOIN inventory ref_inventory 
                        ON f.film_id = ref_inventory.film_id 
                        WHERE ref_inventory.inventory_id = q.inventory_id) q2 
        ON true"


#Define pagila film list   
begin
    all_actor_of(f::Pagila.FilmRow) = f |> Pagila.all_film_actor_of |> Pagila.actor_of
    all_category_of(f::Pagila.FilmRow) = f |> Pagila.all_film_category_of |> Pagila.category_of
    actor_name(actor) = actor.first_name * " " * actor.last_name
    @testsql Pagila.query_film() |>
             map(film ->
                 let category = all_category_of(film),
                     actor = all_actor_of(film)

                     (fid=film.film_id,
                         film.title,
                         film.description,
                         category=category.name,
                         price=film.rental_rate,
                         film.length,
                         film.rating,
                         actors=join(actor_name(actor), ", ")
                     )
                 end) |>
                 groupby(r -> Tuple(v for (k, v) in pairs(r) if k != :actors)),
    """
        SELECT f.film_id                                                                AS fid,
        f.title,
        f.description,
        ref_category.name                                                        AS category,
        f.rental_rate                                                            AS price,
        f.length,
        f.rating,
        string_agg(CONCAT(ref_actor.first_name, ' ', ref_actor.last_name), ', ') AS actors
    FROM film f
            INNER JOIN film_actor ref_film_actor ON f.film_id = ref_film_actor.film_id
            INNER JOIN actor ref_actor ON ref_film_actor.actor_id = ref_actor.actor_id
            INNER JOIN film_category ref_film_category ON f.film_id = ref_film_category.film_id
            INNER JOIN category ref_category ON ref_film_category.category_id = ref_category.category_id
    GROUP BY f.film_id, f.title, f.description, ref_category.name, f.rental_rate, f.length, f.rating
    """
end