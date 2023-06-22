
@testset "update command" begin
    @testsql (@update Pagila.Customer begin
        filter(c -> c.customer_id == 1, _)
        set(c -> (email="newemail@example.com",), _)
    end),
    "UPDATE customer c
    SET email = 'newemail@example.com' 
    WHERE c.customer_id = 1"

    all_film_of(c::Pagila.Category) = all_film_category_of(c) |> Pagila.film_of
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
            (return_date = Date("2023-10-6"),)
        end
    end),
    "UPDATE rental r 
        SET return_date = '2023-10-6'::date FROM inventory i
        INNER JOIN film f ON i.film_id = f.film_id 
        INNER JOIN film_category f2 ON f.film_id = f2.film_id 
        WHERE (r.inventory_id = i.inventory_id) AND (f2.category_id = 1) AND (f.length > 120)"
end

