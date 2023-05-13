
@info "Running operators by tests"
@testset "comparison operators" begin

    table = TableSource(:person_salaries, :person_id => UUIDType, :surname => TextType, :salary => Int8Type)
    @info "== != > < >= <="
    @testsql filter(t -> t.salary > 50000, table)  "SELECT p.person_id, p.surname, p.salary FROM person_salaries p WHERE p.salary > 50000"
    @testsql filter(t -> !(t.salary > 50000), table) "SELECT p.person_id, p.surname, p.salary FROM person_salaries p WHERE p.salary <= 50000"
    @testsql filter(t -> !(t.salary == 50000), table) "SELECT p.person_id, p.surname, p.salary FROM person_salaries p WHERE p.salary <> 50000"
    @testsql join((a, b) -> a.salary > b.salary, table, table) "SELECT * FROM person_salaries p INNER JOIN person_salaries p2 ON p.salary > p2.salary"

    @testset "between predicates" begin
        @testsql table |> filter(t -> t.salary in 1000:2000)  "SELECT p.person_id, p.surname, p.salary FROM person_salaries p WHERE p.salary BETWEEN 1000 AND 2000"
        @testsql table |> filter(t -> t.salary in t.salary:2000)  "SELECT p.person_id, p.surname, p.salary FROM person_salaries p WHERE p.salary BETWEEN p.salary AND 2000"
    end


    
end

@testset "arithmetic operators" begin
    table = TableSource(:person_salaries, :person_id => UUIDType, :surname => TextType, :salary => Int8Type)
    @info "multiplication"
    @test string(map(t -> t.salary * 50000, table)) === "SELECT p.salary * 50000 AS elem1 FROM person_salaries p"
    @test string(map(t -> (t.salary - 50000 + 5) * 8 % t.salary^4, table)) === "SELECT (p.salary - 50000 + 5) * 8 % p.salary ^ 4 AS elem1 FROM person_salaries p"
end

