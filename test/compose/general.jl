import SQLCompose: TableSource, ValuesTableItem, TextType, query, Int8Type, BooleanType, →, Int8Type

@info "Running general composition tests"
@testset "general" begin

    @testset "aliasing" begin
        persons = TableSource(:persons, :id => Int8Type, :surname => TextType; aliashint=:per)
        @info "conflicting alias"
        persons2 = persons → :per2
        @testsql join(join(query(persons), query(persons)), persons2) do a, b, c
            true
        end, "SELECT * FROM persons per INNER JOIN persons per2 ON true INNER JOIN persons per22 ON true"

        @info "cte common table, private space"
        @testsql with(persons) do p1
            with(filter(p -> p.id in (map(p1, :id)), persons)) do p2
                join(p1, p2)
            end
        end """
        WITH per AS (SELECT per.id, per.surname FROM persons per), 
        q AS (SELECT per2.id, per2.surname FROM persons per2 WHERE per2.id IN (SELECT per.id FROM per)) 
            SELECT * FROM per INNER JOIN q ON true
        """
    end
    
    @testset "distinct / distinct on" begin
        @testsql query(Pagila.Actor) |> unique, "
            SELECT DISTINCT
                a.actor_id,
                a.first_name,
                a.last_name,
                a.last_update
            FROM actor a
        "

        @testsql (@query Pagila.Actor begin
            unique(_) do a
                (a.first_name, a.last_name)
            end
            map(_) do a
                (;a.first_name, a.last_name, any_actor_id=a.actor_id)
            end
        end
        ), """
        SELECT DISTINCT ON(
                    a.first_name, 
                    a.last_name)
            a.first_name,
            a.last_name,
            a.actor_id AS any_actor_id
        FROM actor a
        """
    end

end