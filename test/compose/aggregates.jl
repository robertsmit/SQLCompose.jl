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
            map((f, fa, a) -> (; f.title, actors=collect(fullname(a))))
        end,
        "SELECT f.title, array_agg(CONCAT(a.first_name, ' ', a.last_name)) AS actors FROM film f 
            INNER JOIN film_actor f2 ON f.film_id = f2.film_id 
            INNER JOIN actor a ON a.actor_id = f2.actor_id 
            GROUP BY f.title 
            ORDER BY f.title"

        @info "with laterals"
        @testsql begin
            Pagila.query_film_actor() |>
            map((fa) -> (title=Pagila.film_of(fa).title, actors=(Pagila.actor_of(fa) |> fullname |> collect))) |>
            groupby(r -> r.title) |>
            sort(r -> r.title)
        end,
        "SELECT lat_film.title, array_agg(CONCAT(lat_actor.first_name, ' ', lat_actor.last_name)) AS actors FROM film_actor f 
            INNER JOIN film lat_film ON f.film_id = lat_film.film_id 
            INNER JOIN actor lat_actor ON f.actor_id = lat_actor.actor_id 
            GROUP BY lat_film.title 
            ORDER BY lat_film.title"
    end

    begin
        #Calculate the average replacement cost of all films: 21.09
        @testsql map(Pagila.query_film()) do f
            round(avg(f.replacement_cost), digits=2)
        end,
        "SELECT round(avg(f.replacement_cost), 2) AS elem1 FROM film f"
    end

    begin
        #get the number of drama films: 62
        @testsql begin
            Pagila.query_film_category() |>
            filter(fc -> Pagila.category_of(fc).category_id == 7) |>
            map(fc -> count())
        end,
        "SELECT count(*) AS elem1 FROM film_category f 
            INNER JOIN category lat_category ON f.category_id = lat_category.category_id 
            WHERE lat_category.category_id = 7"

    end

    begin
        # the maximum replacement cost of films: 29.99
        max_replacement_cost = map(Pagila.query_film()) do f
            maximum(f.replacement_cost)
        end
        @testsql max_replacement_cost,
        "SELECT max(f.replacement_cost) AS elem1 FROM film f"

        # films that have the maximum replacement cost
        @testsql begin
            Pagila.query_film() |>
            filter(f -> f.replacement_cost == max_replacement_cost) |>
            map(f -> (; f.film_id, f.title)) |>
            sort(r -> r.title)
        end,
        "SELECT f.film_id, f.title FROM film f 
            WHERE f.replacement_cost = (SELECT max(f2.replacement_cost) AS elem1 FROM film f2) 
            ORDER BY f.title"

        # the minimum replacement cost of films
        min_replacement_cost = map(Pagila.query_film()) do f
            minimum(f.replacement_cost)
        end
        @testsql min_replacement_cost,
        "SELECT min(f.replacement_cost) AS elem1 FROM film f"

    end

    begin
        # calculate the total length of films grouped by film’s rating
        @testsql begin
            Pagila.query_film() |> 
            sort(:rating) |>
            groupby(:rating) |>
            map(f -> (;f.rating, sum = sum(f.rental_duration)))

        end,
        "SELECT f.rating, sum(f.rental_duration) AS sum FROM film f GROUP BY f.rating ORDER BY f.rating"
    end

end


