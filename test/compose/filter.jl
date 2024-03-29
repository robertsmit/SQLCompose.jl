#=
compose:
- Julia version: 
- Author: Rob
- Date: 2022-04-19
=#
import SQLCompose: TableSource, ValuesTableItem, TextType, query, Int8Type, BooleanType, →

@info "Running filter tests"
@testset "filter" begin

    @testset "basic filtering" begin
        @info "equality: table"
        begin
            table = TableSource(:persons, :surname => TextType; aliashint=:per)
            q = filter(table) do t
                t.surname == "Smit"
            end
            @testsql q "SELECT per.surname FROM persons per WHERE per.surname = 'Smit'"
        end

        @info "equality"
        begin
            table = TableSource(:persons, :surname => TextType, :firstname => TextType)
            q = filter(p -> p.surname == "Smit", table)
            @testsql q "SELECT p.surname, p.firstname FROM persons p WHERE p.surname = 'Smit'"
            q = filter(p -> p.surname == p.firstname, table)
            @testsql q "SELECT p.surname, p.firstname FROM persons p WHERE p.surname = p.firstname"
            q = filter(p -> p.surname != p.firstname, table)
            @testsql q "SELECT p.surname, p.firstname FROM persons p WHERE p.surname <> p.firstname"
        end

        @info "equality: correlated subquery"
        begin
            table = TableSource(:persons, :id => Int8Type, :surname => TextType; aliashint=:per)
            # persons with non unique surname
            q = filter(table) do t
                t.surname == map(t2 -> t2.surname, filter(t2 -> (t2.surname == t.surname) & (t2.id != t.id), table))
            end
            @testsql q,
            "SELECT per.id, per.surname FROM persons per WHERE per.surname = 
            (SELECT per2.surname FROM persons per2 WHERE (per2.surname = per.surname) AND (per2.id <> per.id))"
        end

        @info "semi-join / anti-join"
        begin
            table = TableSource(:persons, :id => Int8Type, :surname => TextType; aliashint=:per)
            # persons with non unique surname
            q = filter(table) do t1
                subquery = filter(t2 -> (t2.id != t1.id) & (t2.surname == t1.surname), table → :other)
                !isempty(subquery)
            end
            @testsql q,
            "SELECT per.id, per.surname FROM persons per WHERE EXISTS (SELECT 1 AS elem1 FROM persons other WHERE (other.id <> per.id) AND (other.surname = per.surname))"
            # persons with unique surname
            q2 = filter(table → :source) do t1
                subquery = filter(t2 -> !(t2.id == t1.id) & (t2.surname == t1.surname), table → :other)
                isempty(subquery)
            end
            @testsql q2 "SELECT source.id, source.surname FROM persons source WHERE NOT EXISTS (SELECT 1 AS elem1 FROM persons other WHERE (other.id <> source.id) AND (other.surname = source.surname))"
        end

        @info "is null / is not null"
        begin
            table = TableSource(:persons, :id => Int8Type, :surname => TextType; aliashint=:per)
            # persons with missing surname
            q = filter(t -> ismissing(t.surname), table)
            @testsql q "SELECT per.id, per.surname FROM persons per WHERE per.surname IS NULL"
            # persons with known surname
            q = filter(t -> !ismissing(t.surname), table)
            @testsql q  "SELECT per.id, per.surname FROM persons per WHERE per.surname IS NOT NULL"
        end

        @info "function call"
        begin
            table = TableSource(:persons, :id => Int8Type, :surname => TextType; aliashint=:per)
            # persons non empty surname
            q = map(t -> length(t.surname), table)
            @testsql q "SELECT length(per.surname) AS elem1 FROM persons per"
        end

        @info "in array"
        begin
            table = TableSource(:persons, :id => Int8Type, :surname => TextType; aliashint=:per)
            # persons non empty surname
            @info "in literal"
            q = filter(t -> t.id in [1, 2, 3], table)
            @testsql q "SELECT per.id, per.surname FROM persons per WHERE per.id IN (1, 2, 3)"
            @info "in self ref"
            q = filter(t -> t.id in [t.id + 1, t.id + 2], table)
            @testsql q "SELECT per.id, per.surname FROM persons per WHERE per.id IN (per.id + 1, per.id + 2)"
        end




    end

    table = TableSource(:employments, :id => Int8Type, :is_male => BooleanType, :surname => TextType; aliashint=:employments)
    q = query(table)
    qTrue = filter(e -> true, q)
    @testsql qTrue "SELECT employments.id, employments.is_male, employments.surname FROM employments"
    qFalse = filter(e -> false, q)
    @testsql qFalse, "SELECT employments.id, employments.is_male, employments.surname FROM employments WHERE false"
    qMale = filter(e -> e.is_male, q)
    @testsql qMale  "SELECT employments.id, employments.is_male, employments.surname FROM employments WHERE employments.is_male"
    qNotMale = filter(e -> !e.is_male, q)
    @testsql qNotMale "SELECT employments.id, employments.is_male, employments.surname FROM employments WHERE NOT employments.is_male"
    qSurname = filter(e -> e.surname == "banana", q)
    @testsql qSurname "SELECT employments.id, employments.is_male, employments.surname FROM employments WHERE employments.surname = 'banana'"
    qSurnameReverse = filter(e -> "banana" == e.surname, q)
    @testsql qSurnameReverse "SELECT employments.id, employments.is_male, employments.surname FROM employments WHERE 'banana' = employments.surname"
    qSurnameOrMale = filter(e -> e.is_male, qSurname)
    @testsql qSurnameOrMale "SELECT employments.id, employments.is_male, employments.surname FROM employments WHERE (employments.surname = 'banana') AND employments.is_male"
    qSurnameAnyOrMale = filter(e -> ((e.surname == "Smith") | (e.surname == "Adams")) & e.is_male, q)
    @testsql qSurnameAnyOrMale "SELECT employments.id, employments.is_male, employments.surname FROM employments WHERE ((employments.surname = 'Smith') OR (employments.surname = 'Adams')) AND employments.is_male"
    qMaleCast = filter(e -> !(convert(Int8Type(), e.is_male) == 0), q)
    @testsql qMaleCast "SELECT employments.id, employments.is_male, employments.surname FROM employments WHERE employments.is_male::bigint <> 0"


    @testset "Pattern match" begin
        actors = map(Pagila.Actor, :actor_id, :first_name, :last_name)

        @testsql filter(a -> contains(a.first_name, "JO"), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.first_name LIKE '%JO%'"

        @testsql filter(a -> contains(a, "a%b_c"), query("%a%b_c")),
        "SELECT q.elem1 FROM (SELECT '%a%b_c' AS elem1) q WHERE q.elem1 LIKE '%a\\%b\\_c%'"

        @testsql filter(a -> contains(a.last_name, like"J%N"), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name LIKE 'J%N'"

        @testsql filter(a -> a.last_name == like"J%N", actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name LIKE 'J%N'"

        @testsql filter(a -> a.last_name == ilike"j%N", actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name ILIKE 'j%N'"

        @testsql filter(a -> a.last_name != like"J%N", actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name NOT LIKE 'J%N'"

        @testsql filter(a -> contains(a.last_name, first(a.first_name, 2)), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name LIKE CONCAT('%', left(a.first_name, 2), '%')"

        @testsql filter(a -> a.last_name == like(first(a.first_name, 2) * "%"), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name LIKE CONCAT(left(a.first_name, 2), '%')"

        @testsql filter(a -> a.last_name == matching(first(a.first_name, 2)), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name ~ left(a.first_name, 2)"
        

        @testsql filter(a -> occursin(r"JO", a.last_name), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name ~ 'JO'"

        @testsql filter(a -> !occursin(r"JO", a.last_name), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name !~ 'JO'"

        @testsql filter(a -> occursin(r"jo", a.last_name; casesensitive=false), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name ~* 'jo'"

        @testsql filter(a -> a.last_name == matching(a.first_name, casesensitive=false), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name ~* a.first_name"

        @testsql filter(a -> contains(a.last_name, similarto"%[AB]%"), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name SIMILAR TO '%[AB]%'"

        @testsql filter(a -> !contains(a.last_name, similarto"%[AB]%"), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name NOT SIMILAR TO '%[AB]%'"

        @testsql filter(a -> !contains(a.last_name, similarto"%[AB]%"), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name NOT SIMILAR TO '%[AB]%'"

        @testsql filter(a -> !(!contains(a.last_name, similarto"%[AB]%")), actors),
        "SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.last_name SIMILAR TO '%[AB]%'"
    end

    @testset "Advanced filtering" begin
        @info "Filter subquery result"
        @testsql (@query Pagila.Actor begin
            map(_) do a
                longest_film = @query Pagila.Film begin
                    filter(f -> Pagila.all_film_actor_of(f).actor_id == a.actor_id, _)
                    map(f -> maximum(f.length), _)
                end
                (; a.actor_id,
                    longest_film
                )
            end
            filter(r -> r.longest_film < 60, _)
        end),
        "SELECT 
            a.actor_id, 
            (SELECT max(f.length) AS elem1 FROM film f INNER JOIN film_actor ref_film_actor ON f.film_id = ref_film_actor.film_id WHERE ref_film_actor.actor_id = a.actor_id) AS longest_film 
        FROM actor a 
        WHERE (SELECT max(f.length) AS elem1 
                FROM film f 
                INNER JOIN film_actor ref_film_actor ON f.film_id = ref_film_actor.film_id 
                WHERE ref_film_actor.actor_id = a.actor_id) 
                < 60"

    end

end