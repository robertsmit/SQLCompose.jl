#=
map:
- Julia version: 
- Author: Rob
- Date: 2022-04-22
=#
import SQLCompose: TextType, query, TableDefinition, Int8Type, BooleanType, map, join
using Chain
using Test: @testset, @test, @test_throws

@info "Running join tests"
emps = TableDefinition(:employments, :id => Int8Type, :first_name => TextType, :initials => TextType,
    :surname => TextType, :manager_id => Int8Type; aliashint=:emp)

@testset "join" begin

    achs = TableDefinition(:achievements, :id => Int8Type, :employment_id => Int8Type, :qualification_id => Int8Type; aliashint=:ach)
    qs = TableDefinition(:qualifications, :id => Int8Type, :name => TextType)

    emp_ach = join((e, a) -> e.id == a.employment_id, emps, achs)
    @testsql emp_ach "SELECT * FROM employments emp INNER JOIN achievements ach ON emp.id = ach.employment_id"
    emp_ach_q = join((e, a, q) -> a.qualification_id == q.id, emp_ach, qs,)
    emp_ach_q_map = map(emp_ach_q) do e, a, q
        (q.id, q.name, a.employment_id)
    end
    @testsql emp_ach_q_map "SELECT q.id AS elem1, q.name AS elem2, ach.employment_id AS elem3 
            FROM employments emp 
            INNER JOIN achievements ach ON emp.id = ach.employment_id 
            INNER JOIN qualifications q ON ach.qualification_id = q.id"
    emp_ach_q_map_named = map(emp_ach_q) do e, a, q
        (; q.id, q.name, a.employment_id)
    end
    @testsql emp_ach_q_map_named "SELECT q.id, q.name, ach.employment_id FROM employments emp INNER JOIN achievements ach ON emp.id = ach.employment_id INNER JOIN qualifications q ON ach.qualification_id = q.id"
    @test_throws "cannot right join unmerged results" join((q, e, a) -> q.id == a.qualification_id, qs, emp_ach)


    q_emp_ach_map = join((q, ea) -> q.id == ea.q_id, qs,
        map((e, a) -> (emp_id=e.id, ach_id=a.id, q_id=a.qualification_id), emp_ach))
    @testsql q_emp_ach_map "SELECT * FROM qualifications q 
        INNER JOIN (SELECT emp.id AS emp_id, ach.id AS ach_id, ach.qualification_id AS q_id 
                            FROM employments emp INNER JOIN achievements ach ON emp.id = ach.employment_id) q2 
        ON q.id = q2.q_id"
    map_q_emp_ach_map = map((q, ea) -> (q.name, ea), q_emp_ach_map)

    @testsql map_q_emp_ach_map,
    "SELECT q.name AS elem1, q2.emp_id AS elem2_emp_id, q2.ach_id AS elem2_ach_id, q2.q_id AS elem2_q_id 
        FROM qualifications q 
        INNER JOIN (SELECT emp.id AS emp_id, ach.id AS ach_id, ach.qualification_id AS q_id FROM employments emp INNER JOIN achievements ach ON emp.id = ach.employment_id) q2 
        ON q.id = q2.q_id"


    @info "join with combined query"
    withcombined = @chain achs begin
        vcat(map(_, :id), map(qs, :id))
        join((l, r) -> l.id == r.id, _, emps)
    end
    @testsql withcombined,
    "SELECT * FROM (SELECT ach.id FROM achievements ach UNION SELECT q.id FROM qualifications q) q 
        INNER JOIN employments emp ON q.id = emp.id"

    @info "join with cte query"
    withcte = @chain achs begin
        with(_) do ach
            map(ach, :id, :employment_id)
        end
        join(_, emps) do a, e
            a.employment_id == e.id
        end
    end
    @testsql withcte """
    WITH ach AS (SELECT ach.id, ach.employment_id, ach.qualification_id FROM achievements ach)
        SELECT * FROM ach INNER JOIN employments emp ON ach.employment_id = emp.id
    """

    @testset "join with subquery condition" begin
        subq_condition = @chain emps begin
            join(_, qs) do e, q
                q.id in map(a -> a.qualification_id,
                    filter(a -> a.employment_id == e.id, achs))
            end
            join(_, achs) do e, q, a
                q.id == a.qualification_id
            end
            map((e, q, a) -> (e.id, q.id, a.id), _)
        end
        @testsql subq_condition """
            SELECT emp.id AS elem1, q.id AS elem2, ach.id AS elem3 FROM employments emp 
                INNER JOIN qualifications q 
                    ON q.id IN (SELECT ach.qualification_id FROM achievements ach WHERE ach.employment_id = emp.id) 
                INNER JOIN achievements ach ON q.id = ach.qualification_id
        """
    end


    @testset "join cartesian" begin
        emp_emp = join(emps, emps)
        @testsql emp_emp "SELECT * FROM employments emp INNER JOIN employments emp2 ON true"
    end

    @testset "self join" begin
        table = TableDefinition(:t, :c1 => Int8Type, :c2 => TextType, :c3 => TextType, :c4 => TextType)
        selfjoin = join(table, table, :c1 => :c1, :c2 => :c2)
        @testsql selfjoin "SELECT * FROM t INNER JOIN t t2 ON (t.c1 = t2.c1) AND (t.c2 = t2.c2)"
        @testsql map((t1, t2) -> t1.c1, selfjoin) "SELECT t.c1 FROM t INNER JOIN t t2 ON (t.c1 = t2.c1) AND (t.c2 = t2.c2)"
    end


    @testset "lateral join" begin
        @testsql join_lateral(query([(1,)])) do f
            unnest([f.elem1 + 1, f.elem1 + 2])
        end,
        "SELECT * FROM (VALUES (1)) AS v (elem1) INNER JOIN LATERAL unnest(ARRAY[v.elem1 + 1, v.elem1 + 2]) u (val) ON true"
    end
end


