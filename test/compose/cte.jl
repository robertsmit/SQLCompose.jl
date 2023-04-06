@info "Running cte tests"
@testset "cte" begin
    persons = TableDefinition(:persons, :person_id => SQLCompose.UUIDType, :surname => SQLCompose.TextType)
    salaries = TableDefinition(:persons_salaries, :person_id => SQLCompose.UUIDType, :salary => SQLCompose.Int8Type)

    @info "simple useless cte"
    @testsql with(t -> t, persons), "WITH p AS (SELECT p.person_id, p.surname FROM persons p) SELECT p.person_id, p.surname FROM p"

    @info "multiple tables"
    @testsql begin
        with(persons, salaries) do p, s
            join((p, s) -> p.person_id == s.person_id, p, s)
        end
        "WITH p AS (SELECT p.person_id, p.surname FROM persons p), p2 AS (SELECT p2.person_id, p2.salary FROM persons_salaries p2) SELECT * FROM p INNER JOIN p2 ON p.person_id = p2.person_id"    
    end

    @info "nested tables"
    @testsql begin
        johns = filter(p -> p.surname == "John", persons)
        with(johns) do p
            johnssalaries = map((s, p) -> (p.surname, s.salary), join((s, p) -> s.person_id == p.person_id, salaries, p))
            with(johnssalaries) do s
                map(first, s)
            end
        end
    end,
    "WITH q AS (SELECT p.person_id, p.surname FROM persons p WHERE p.surname = 'John'), q2 AS (SELECT q.surname AS elem1, p.salary AS elem2 FROM persons_salaries p INNER JOIN q ON p.person_id = q.person_id) SELECT q2.elem1 FROM q2"


    @info "nested tables with subquery"
    @testsql begin
        johns = filter(p -> p.surname == "John", persons)
        with(johns) do p
            johnssalaries = map((s, p) -> (p.surname, s.salary), join((s, p) -> s.person_id == p.person_id, salaries, p))
            query(with(johnssalaries) do s
                map(first, s)
            end)
        end
    end,
    "WITH q AS (SELECT p.person_id, p.surname FROM persons p WHERE p.surname = 'John') 
        SELECT q2.elem1 FROM (WITH q2 AS (SELECT q.surname AS elem1, p.salary AS elem2 FROM persons_salaries p INNER JOIN q ON p.person_id = q.person_id) SELECT q2.elem1 FROM q2) q2"


    result = @chain persons begin
        filter(p -> p.surname == "John", _)
        with(_) do p
            @chain p begin
                join(_, salaries) do a, b
                    a.person_id == b.person_id
                end
                map(_) do a, b
                    (a.surname, b.salary)
                end
            end
        end
        with(s -> filter(d -> ismissing(d[1]), s), _)
    end
    @testsql result """
        WITH    q AS (SELECT p.person_id, p.surname FROM persons p WHERE p.surname = 'John'), 
                q2 AS (SELECT q.surname AS elem1, p.salary AS elem2 FROM q INNER JOIN persons_salaries p ON q.person_id = p.person_id) 
        SELECT q2.elem1, q2.elem2 FROM q2 WHERE q2.elem1 IS NULL
    """

    @testset "recursive cte" begin
        plusone(x) = x + 1
        recurse = iterate(query(1)) do base
            @chain base filter(<(100), _) map(plusone, _)
        end
        result = map(sum, recurse)
        @testsql result "WITH RECURSIVE q AS (SELECT 1 AS elem1 UNION ALL SELECT q.elem1 + 1 AS elem1 FROM q WHERE q.elem1 < 100) SELECT sum(q.elem1) AS elem1 FROM q"
    end
end

