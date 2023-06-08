
@info "Running group by tests"
@testset "group by" begin
    table = TableSource(:persons_salaries, :person_id => UUIDType, :salary => Int8Type)
    grouped = groupby(table, :salary, :person_id)

    @testsql grouped,
    "SELECT p.person_id, p.salary
    FROM persons_salaries p 
    GROUP BY p.salary, p.person_id"

    @testsql having(e -> sum(e.salary) > 1000, grouped),
    "SELECT p.person_id, p.salary FROM persons_salaries p
     GROUP BY p.salary, p.person_id 
     HAVING sum(p.salary) > 1000"

end