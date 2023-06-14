
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
        set(_) do r, i
            (rental_id=1,)
        end
    end),
    "UPDATE rental r SET rental_id = 1 FROM inventory i WHERE r.inventory_id = i.inventory_id"
end

