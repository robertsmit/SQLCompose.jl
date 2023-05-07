#=
map:
- Julia version: 
- Author: Rob
- Date: 2022-04-22
=#
using SQLCompose


@info "Running group by tests"
@testset "group by" begin
    table = TableDefinition(:persons_salaries, :person_id => UUIDType, :salary => Int8Type)
    grouped = groupby(table, :salary, :person_id)
    q = map(grouped, :salary)
    @test string(q) === "SELECT p.salary FROM persons_salaries p GROUP BY p.salary, p.person_id"
    q = having(e -> sum(e.salary) > 1000, q)
    @test string(q) === "SELECT p.salary FROM persons_salaries p GROUP BY p.salary, p.person_id HAVING sum(p.salary) > 1000"

end