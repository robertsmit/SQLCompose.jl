# SQLCompose.jl

*SQLCompose implements the compositional construction of SQL queries.*

[![Documentation][docs-rel-img]][docs-rel-url]

## Overview

The goal of this package is to use julia's means of abstraction to built SQL queries.
The SQL language has no good built-in abstraction methods. By using julia methods for abstraction it
is such easier to built complex queries.

Also retrieving the data of the queried julia structure is supported.

Supports generating query code from existing database.

See samples.jl in the test directory.

Example:
```
#Define pagila film list   
begin
    all_actor_of(f::Pagila.FilmRow) = f |> Pagila.all_film_actor_of |> Pagila.actor_of
    all_category_of(f::Pagila.FilmRow) = f |> Pagila.all_film_category_of |> Pagila.category_of
    actor_name(actor) = actor.first_name * " " * actor.last_name
    @testsql Pagila.query_film() |>
             map(f -> (film=f, category=all_category_of(f), actor=all_actor_of(f))) |>
             map(((; film, actor, category),) ->
                 (fid=film.film_id, film.title, film.description,
                     category=category.name, price=film.rental_rate, film.length, film.rating,
                     actors=join(actor_name(actor), ", ")
                 )) |>
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
```


[docs-rel-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-rel-url]: https://robertsmit.github.io/SQLCompose.jl/
