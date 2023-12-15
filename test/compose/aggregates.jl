@testset "aggregate" begin

    #Bigger aircraft have more seats of various travel classes:
    @testsql begin
        @query Bookings.Seat begin
            groupby(_, :aircraft_code, :fare_conditions)
            sort(_, :aircraft_code, :fare_conditions)
            map(_) do s
                (; s.aircraft_code, s.fare_conditions, num=count(All))
            end
        end
    end,
    "SELECT s.aircraft_code, s.fare_conditions, count(*) AS num FROM seats s 
        GROUP BY s.aircraft_code, s.fare_conditions 
        ORDER BY s.aircraft_code, s.fare_conditions"


    @testsql begin
        @query Bookings.Seat begin
            groupby(_, :aircraft_code, :fare_conditions)
            sort(_, :aircraft_code, :fare_conditions)
            map(_) do s
                (;
                    s.aircraft_code,
                    s.fare_conditions,
                    num_bussiness=count(s.aircraft_code; filter=s.fare_conditions == "Business")
                )
            end
        end
    end,
    "SELECT s.aircraft_code, s.fare_conditions, 
        count(s.aircraft_code) FILTER WHERE (s.fare_conditions = 'Business') AS num_bussiness FROM seats s 
        GROUP BY s.aircraft_code, s.fare_conditions 
        ORDER BY s.aircraft_code, s.fare_conditions"

    @testset "array aggregate" begin
        #Return the list of film title and a list of actors for each film:"
        fullname(actor::Pagila.Actor) = actor.first_name * " " * actor.last_name

        @info "without laterals"
        @testsql begin
            @query Pagila.Film begin
                join(_, Pagila.Film_Actor, :film_id)
                join(_, Pagila.Actor) do f, fa, a
                    a.actor_id == fa.actor_id
                end
                map((f, fa, a) -> (; f.title, actors=collect(fullname(a); sort=(a.last_name,))), _)
                groupby(_, :title)
                sort(_, :title)

            end
        end,
        "SELECT f.title, array_agg(CONCAT(a.first_name, ' ', a.last_name) ORDER BY a.last_name) AS actors FROM film f 
            INNER JOIN film_actor f2 ON f.film_id = f2.film_id 
            INNER JOIN actor a ON a.actor_id = f2.actor_id 
            GROUP BY f.title 
            ORDER BY f.title"

        @info "with laterals"
        @testsql begin
            @chain Pagila.Film_Actor begin
                map(_) do fa
                    (title=Pagila.film_of(fa).title, actors=(Pagila.actor_of(fa) |> fullname |> collect))
                end
                groupby(_, :title)
                sort(_, :title)
            end
        end,
        "SELECT ref_film.title, array_agg(CONCAT(ref_actor.first_name, ' ', ref_actor.last_name)) AS actors 
            FROM film_actor f 
            INNER JOIN film ref_film ON f.film_id = ref_film.film_id 
            INNER JOIN actor ref_actor ON f.actor_id = ref_actor.actor_id 
            GROUP BY ref_film.title 
            ORDER BY ref_film.title"
    end

    begin
        #Calculate the average replacement cost of all films: 21.09
        @testsql map(Pagila.Film) do f
            round(avg(f.replacement_cost), digits=2)
        end,
        "SELECT round(avg(f.replacement_cost), 2) AS elem1 FROM film f"
    end

    begin
        #get the number of drama films: 62
        @testsql begin
            @chain Pagila.Film_Category begin
                filter(fc -> Pagila.category_of(fc).category_id == 7, _)
                map(fc -> count(All), _)
            end
        end,
        "SELECT count(*) AS elem1 FROM film_category f 
            INNER JOIN category ref_category ON f.category_id = ref_category.category_id 
            WHERE ref_category.category_id = 7"

    end

    begin
        # the maximum replacement cost of films: 29.99
        max_replacement_cost = map(Pagila.Film) do f
            maximum(f.replacement_cost)
        end
        @testsql max_replacement_cost,
        "SELECT max(f.replacement_cost) AS elem1 FROM film f"

        # films that have the maximum replacement cost
        @testsql begin
            @chain Pagila.Film begin
                filter(f -> f.replacement_cost == max_replacement_cost, _)
                map(f -> (; f.film_id, f.title), _)
                sort(r -> r.title, _)
            end
        end,
        "SELECT f.film_id, f.title FROM film f 
            WHERE f.replacement_cost = (SELECT max(f2.replacement_cost) AS elem1 FROM film f2) 
            ORDER BY f.title"

        # the minimum replacement cost of films
        @testsql map(Pagila.Film) do f
            minimum(f.replacement_cost)
        end,
        "SELECT min(f.replacement_cost) AS elem1 FROM film f"

    end

    begin
        # calculate the total length of films grouped by film’s rating
        @testsql begin
            @chain Pagila.Film begin
                sort(_, :rating)
                groupby(_, :rating)
                map(f -> (; f.rating, sum=sum(f.rental_duration)), _)
            end
        end,
        "SELECT f.rating, sum(f.rental_duration) AS sum FROM film f GROUP BY f.rating ORDER BY f.rating"
    end

end


