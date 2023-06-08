
@testset "update command" begin
    @testsql (@update Pagila.Customer begin
        filter(c -> c.customer_id == 1, _)
        set(c -> (email="newemail@example.com",), _)
    end),
    "UPDATE customer c
    SET email = 'newemail@example.com' 
    WHERE c.customer_id = 1"
end