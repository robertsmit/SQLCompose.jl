
@testset "update command" begin
    @testsql (@update Pagila.Customer begin
        filter(c -> c.customer_id == 1, _)
        set(c -> (email="newemail@example.com",), _)
    end),
    "UPDATE customer c
    SET email = 'newemail@example.com' 
    WHERE c.customer_id = 1"

    @testsql (@update Pagila.Rental begin
        join(_, Pagila.Inventory) do r, i
            r.inventory_id == i.inventory_id
        end
        join(_, Pagila.Film) do r, i, f
            i.film_id == f.film_id
        end
        join(_, Pagila.Film_Category) do r, i, f, fc
            f.film_id == fc.film_id
        end
        filter(_) do r, i, f, fc
            fc.category_id == 1 && f.length > 120
        end
        set(_) do r, i, f, fc
            (rental_period=Date("2023-10-6"),)
        end
    end),
    "UPDATE rental r 
        SET rental_period = '2023-10-6'::date 
        FROM inventory i
        INNER JOIN film f ON i.film_id = f.film_id 
        INNER JOIN film_category f2 ON f.film_id = f2.film_id 
        WHERE (r.inventory_id = i.inventory_id) AND (f2.category_id = 1) AND (f.length > 120)"

    @info "with refs"
    film_of(r::Pagila.Rental) = Pagila.inventory_of(r) |> Pagila.film_of
    @testsql (@update Pagila.Rental begin       
        filter(_) do r
            let film = film_of(r)
                Pagila.all_film_category_of(film).category_id == 1 && film.length > 120
            end            
        end
        set(_) do r
            (rental_period=DateTime("2023-10-6"):DateTime("2023-10-6"),)
        end
    end),
    "UPDATE rental r 
        SET rental_period = tsrange('2023-10-6'::timestamp, '2023-10-6'::timestamp, '[]')
        FROM inventory ref_inventory 
        INNER JOIN film ref_film ON ref_inventory.film_id = ref_film.film_id 
        INNER JOIN film_category ref_film_category ON ref_film.film_id = ref_film_category.film_id 
        WHERE (ref_film_category.category_id = 1) AND (ref_film.length > 120) AND (r.inventory_id = ref_inventory.inventory_id)"

    @info "with cte"
    @testsql (
        with(map(Pagila.Film, :film_id, :length)) do f
            @update Pagila.Rental begin
                join(_, Pagila.Inventory) do r, i
                    r.inventory_id == i.inventory_id
                end
                join(_, f) do r, i, f
                    i.film_id == f.film_id
                end
                filter(_) do r, i, f
                    f.length > 120
                end
                set(_) do r, i, f
                    (rental_period=(DateTime("2023-10-6T9"):DateTime("2023-10-6T10")),)
                end
            end
        end
    ),
    "
    WITH q AS (SELECT f.film_id, f.length FROM film f) 
    UPDATE rental r 
    SET rental_period = tsrange('2023-10-6 9:0:0'::timestamp, '2023-10-6 10:0:0'::timestamp, '[]')
    FROM inventory i 
    INNER JOIN q ON i.film_id = q.film_id 
    WHERE (r.inventory_id = i.inventory_id) AND (q.length > 120)
    "

    @info "returning"
    @testsql (@update Pagila.Rental begin       
        filter(r -> false, _)
        map(_) do r
            r.inventory_id
        end
    end), "UPDATE rental r 
    SET rental_id = r.rental_id, inventory_id = r.inventory_id, customer_id = r.customer_id, staff_id = r.staff_id, last_update = r.last_update, rental_period = r.rental_period 
    WHERE false RETURNING r.inventory_id"
end





