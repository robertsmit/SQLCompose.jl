@testset "aggregate" begin

    #Bigger aircraft have more seats of various travel classes:
    @testsql begin
        Bookings.query_seats() |>
        groupby(:aircraft_code, :fare_conditions) |>
        sort(:aircraft_code, :fare_conditions) |>
        map(s -> (; s.aircraft_code, s.fare_conditions, num=count()))

    end,
    "SELECT s.aircraft_code, s.fare_conditions, count(*) AS num FROM seats s 
        GROUP BY s.aircraft_code, s.fare_conditions 
        ORDER BY s.aircraft_code, s.fare_conditions"


    @testsql begin
        basequery = Bookings.query_seats() |>
                    groupby(:aircraft_code, :fare_conditions) |>
                    sort(:aircraft_code, :fare_conditions) |>
                    map(s -> (; s.aircraft_code, s.fare_conditions, num_bussiness=count(s.aircraft_code; filter=s.fare_conditions == "Business")))
        basequery
    end,
    "SELECT s.aircraft_code, s.fare_conditions, 
        count(s.aircraft_code) FILTER WHERE(s.fare_conditions = 'Business') AS num_bussiness FROM seats s 
        GROUP BY s.aircraft_code, s.fare_conditions 
        ORDER BY s.aircraft_code, s.fare_conditions"

    # """SELECT
    # title,
    # ARRAY_AGG (first_name || ' ' || last_name) actors
    # FROM
    # film
    # INNER JOIN film_actor USING (film_id)
    # INNER JOIN actor USING (actor_id)
    # GROUP BY
    # title
    # ORDER BY
    # title;"""


    @testset "array aggregate" begin
        #Return the list of film title and a list of actors for each film:"

        fullname(actor::Pagila.ActorRow) = actor.first_name * " " * actor.last_name

        @info "without laterals"
        @testsql begin
            Pagila.query_film() |>
            join(Pagila.query_film_actor(), :film_id) |>
            join(Pagila.query_actor()) do f, fa, a
                a.actor_id == fa.actor_id
            end |>
            groupby((f, fa, a) -> f.title) |>
            sort((f, fa, a) -> f.title) |>
            map((f, fa, a) -> (; f.title, actors=array_agg(fullname(a))))
        end,
        "SELECT f.title, array_agg(CONCAT(a.first_name, ' ', a.last_name)) AS actors FROM film f 
            INNER JOIN film_actor f2 ON f.film_id = f2.film_id 
            INNER JOIN actor a ON a.actor_id = f2.actor_id 
            GROUP BY f.title 
            ORDER BY f.title"

        @info "with laterals"
        @testsql begin
            Pagila.query_film_actor() |>
            map((fa) -> (title=Pagila.film_of(fa).title, actors=(Pagila.actor_of(fa) |> fullname |> array_agg))) |>
            groupby(r -> r.title) |>
            sort(r -> r.title)
        end,
        "SELECT lat_film.title, array_agg(CONCAT(lat_actor.first_name, ' ', lat_actor.last_name)) AS actors FROM film_actor f 
            INNER JOIN film lat_film ON f.film_id = lat_film.film_id 
            INNER JOIN actor lat_actor ON f.actor_id = lat_actor.actor_id 
            GROUP BY lat_film.title 
            ORDER BY lat_film.title"
    end
end