# SQLCompose.jl

*SQLCompose implements the compositional construction of SQL queries.*

[![Documentation][docs-rel-img]][docs-rel-url]

## Overview

The goal of this package is to use julia's means of abstraction to built SQL queries.
The SQL language has no good built-in abstraction methods. By using julia methods for abstraction it
is such easier to built complex queries.

Also retrieving the data of the queried julia structure is supported.

Supports generating query code from existing database.

See [Samples](https://github.com/robertsmit/SQLCompose.jl/blob/main/test/samples.jl).

Examples:
```
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
    
    
    
```


[docs-rel-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-rel-url]: https://robertsmit.github.io/SQLCompose.jl/
