

#All flights are operated by several types of aircraft:
@testsql query(Bookings.Aircraft) "SELECT a.aircraft_code, a.model, a.range FROM aircrafts a"
#For each aircraft type, a separate list of seats is supported. For example, in a small Cessna 208 Caravan, one can select the following seats:
@testsql begin
    @chain Bookings.Aircraft begin
        filter(a -> a.model == "Cessna 208 Caravan", _)
        join(_, Bookings.Seat, :aircraft_code)
        map((a, s) -> (; a.aircraft_code, a.model, s.seat_no, s.fare_conditions), _)
        sort(_, :seat_no)
    end
end,
"SELECT a.aircraft_code, a.model, s.seat_no, s.fare_conditions FROM aircrafts a 
	INNER JOIN seats s ON a.aircraft_code = s.aircraft_code 
	WHERE a.model = 'Cessna 208 Caravan' ORDER BY s.seat_no"

#Bigger aircraft have more seats of various travel classes:
@testsql begin
    seats_fare_condition_nums = @chain Bookings.Seat begin
        groupby(_, :aircraft_code, :fare_conditions)
        sort(_, :aircraft_code, :fare_conditions)
        map(s -> (; s.aircraft_code, s.fare_conditions, num=count(All)), _)
    end
    @chain seats_fare_condition_nums begin
        query(_)
        groupby(_, :aircraft_code)
        sort(_, :aircraft_code)
        map(_) do r
            (; r.aircraft_code,
                fare_conditions=join(r.fare_conditions * "(" * convert(TextType(), r.num) * ")", ", "))
        end
    end
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
    flights_v_of(ticket_flights::Bookings.Ticket_Flight) = SQLCompose.reference(Bookings.Flights_V, :flight_id, ticket_flights.flight_id)
    @chain Bookings.Ticket_Flight begin
        filter(ticketflight -> ticketflight.ticket_no == "0005432661915", _)
        sort(ticketflight -> flights_v_of(ticketflight).scheduled_departure, _)
        map(_) do ticket_flight
            let flight = flights_v_of(ticket_flight)
                (
                    when=string(flight.scheduled_departure; pattern="DD.MM.YYYY"),
                    departure=string(flight.departure_city, " (", flight.departure_airport, ")"),
                    arrival=string(flight.arrival_city, " (", flight.arrival_airport, ")"),
                    class=ticket_flight.fare_conditions,
                    ticket_flight.amount,
                )
            end
        end
    end
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

#Find the id, first name, and last name of an actor of whom you know only the first name of "Joe."
@testsql begin
    @chain Pagila.Actor begin
        filter(a -> occursin("JOE", a.first_name), _)
        map(a -> (; a.actor_id, a.first_name, a.last_name), _)
    end
end,
"SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.first_name LIKE '%JOE%'"

#Retrieve the film title along with the first name and last name of up to 3 actors associated with each film
@testsql begin
    function query_actors(f::Pagila.Film)
        @chain Pagila.Film_Actor begin
            filter(fa -> fa.film_id == f.film_id, _)
            map(Pagila.actor_of, _)
            map(a -> (; a.first_name, a.last_name), _)
        end
    end
    @chain Pagila.Film begin
        left_join_lateral(f -> query_actors(f)[1:3], _)
        map((f, a) -> (; f.title, a.first_name, a.last_name), _)
        sort(values, _)
    end
end,
"SELECT f.title, q.first_name, q.last_name 
	FROM film f 
	LEFT JOIN LATERAL (SELECT ref_actor.first_name, ref_actor.last_name 
				FROM film_actor f2 
				INNER JOIN actor ref_actor ON f2.actor_id = ref_actor.actor_id 
				WHERE f2.film_id = f.film_id 
				LIMIT 3) q ON true
	ORDER BY f.title, q.first_name, q.last_name"


# In this example, we use a LATERAL join to join the customer table 
#     with a subquery that selects the rental_id, inventory_id, 
#     and rental_duration for each film rental associated with the customer_id from the outer query. 
#     We then calculate the rental cost by multiplying the rental_duration and rental_rate for each film.
@testsql begin
    @chain Pagila.Customer begin
        join_lateral(_) do c
            @chain Pagila.Rental begin
                filter(r -> r.customer_id == c.customer_id, _)
                map(r -> (; r.rental_id, r.inventory_id), _)
            end
        end
        join_lateral(_) do c, r
            @chain Pagila.Film begin
                filter(_) do f
                    Pagila.all_inventory_of(f).inventory_id == r.inventory_id
                end
                map(_) do f
                    (; f.title, f.rental_rate, f.rental_duration)
                end
            end
        end
        map((c, r, f) -> (; c.customer_id, f.title, f.rental_rate, rental_cost=f.rental_duration * f.rental_rate), _)
    end
end,
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
@testsql begin
    all_actor_of(f::Pagila.Film) = f |> Pagila.all_film_actor_of |> Pagila.actor_of
    all_category_of(f::Pagila.Film) = f |> Pagila.all_film_category_of |> Pagila.category_of
    actor_name(actor) = actor.first_name * " " * actor.last_name
    @query Pagila.Film begin
        map(_) do film
            let category = all_category_of(film),
                actor = all_actor_of(film)

                (fid=film.film_id,
                    film.title,
                    film.description,
                    category=category.name,
                    price=film.rental_rate,
                    film.length,
                    film.rating,
                    actors=join(actor_name(actor), ", ";
                        sort=(actor.last_name, actor.first_name),
                        filter=!ismissing(actor.last_name)),
                )
            end
        end
        groupby(r -> Tuple(v for (k, v) in pairs(r) if k != :actors), _)
    end
end,
"""
SELECT
        f.film_id AS fid,
        f.title,
        f.description,
        ref_category.name AS category,
        f.rental_rate AS price,
        f.length,
        f.rating,
        string_agg(
                CONCAT(ref_actor.first_name, ' ', ref_actor.last_name), 
                ', '
                ORDER BY 
                        ref_actor.last_name, 
                        ref_actor.first_name)
                FILTER WHERE (ref_actor.last_name IS NOT NULL) AS actors
FROM film f
INNER JOIN film_category ref_film_category
        ON f.film_id = ref_film_category.film_id
INNER JOIN category ref_category
        ON ref_film_category.category_id = ref_category.category_id
INNER JOIN film_actor ref_film_actor
        ON f.film_id = ref_film_actor.film_id
INNER JOIN actor ref_actor
        ON ref_film_actor.actor_id = ref_actor.actor_id
GROUP BY 
        f.film_id, 
        f.title, 
        f.description, 
        ref_category.name, 
        f.rental_rate, 
        f.length, 
        f.rating
"""
# query the full name of actors, first_name or last_name or its combination and last_name or first_name contains "PEN"
@testsql (@query Pagila.Actor begin
    filter(_) do a
        let check = contains("PEN")
            check(a.last_name) || check(a.first_name)
        end
    end
    map(_) do a
        if ismissing(a.last_name) || isempty(a.last_name)
            coalesce(a.first_name, "")
        elseif ismissing(a.first_name) || isempty(a.first_name)
            coalesce(a.last_name, "")
        else
            a.first_name * " " * a.last_name
        end
    end
end),
"SELECT 
    CASE 
    WHEN ((a.last_name IS NULL) OR (a.last_name = '')) 
    THEN coalesce(a.first_name, '') 
    WHEN ((a.first_name IS NULL) OR (a.first_name = '')) 
    THEN coalesce(a.last_name, '') 
    ELSE CONCAT(a.first_name, ' ', a.last_name) END AS elem1 
FROM actor a 
WHERE (a.last_name LIKE '%PEN%') OR (a.first_name LIKE '%PEN%')"

#Let's say we want to retrieve the list of all actors that acted in films longer than 180 minutes, film language is 'English' 
#and film category is not 'Action'.
@testsql begin
    all_film_of(a::Pagila.Actor)::Pagila.Film = a |> Pagila.all_film_actor_of |> Pagila.film_of
    all_category_of(f::Pagila.Film)::Pagila.Category = f |> Pagila.all_film_category_of |> Pagila.category_of
    @query Pagila.Actor begin
        map(_) do a
            let film = all_film_of(a)
                language = Pagila.language_of(film)
                category = all_category_of(film)
                (actor=a, film, category, language)
            end
        end
        sort(r -> (r.actor.actor_id, r.film.film_id), _)
        filter(r -> r.language.name == "English" && r.category.name != "Action" && r.film.length > 180, _)
        map(r -> r.actor, _)
    end
end,
"""
SELECT a.actor_id, a.first_name, a.last_name, a.last_update
FROM actor a
         INNER JOIN film_actor ref_film_actor ON a.actor_id = ref_film_actor.actor_id
         INNER JOIN film ref_film ON ref_film_actor.film_id = ref_film.film_id
         INNER JOIN language ref_language ON ref_film.language_id = ref_language.language_id
         INNER JOIN film_category ref_film_category ON ref_film.film_id = ref_film_category.film_id
         INNER JOIN category ref_category ON ref_film_category.category_id = ref_category.category_id
WHERE (ref_language.name = 'English')
  AND (ref_category.name <> 'Action')
  AND (ref_film.length > 180)
ORDER BY a.actor_id, ref_film.film_id
"""