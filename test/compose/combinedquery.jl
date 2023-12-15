
@info "Running combined query by tests"
@testset "combined queries" begin
    actors = TableSource(:actor, :actor_id => Int4Type, :first_name => SQLCompose.VarCharType, :last_name => SQLCompose.VarCharType)
    customers = TableSource(:customer, :customer_id => Int4Type, :first_name => SQLCompose.VarCharType, :last_name => SQLCompose.VarCharType)
    films = TableSource(:film, :film_id => Int4Type, :title => SQLCompose.VarCharType, :description => SQLCompose.TextType)
    @info "union tables"
    @testsql (vcat(query(actors), query(customers))),
    "SELECT a.actor_id, a.first_name, a.last_name FROM actor a UNION SELECT c.customer_id, c.first_name, c.last_name FROM customer c"

    @info "union all tables"
    @testsql vcat(query(actors), query(customers); unique=false), "SELECT a.actor_id, a.first_name, a.last_name FROM actor a UNION ALL SELECT c.customer_id, c.first_name, c.last_name FROM customer c"

    @info "union 3 tables"
    @testsql vcat(map(actors, :actor_id), map(customers, :customer_id), map(films, :film_id); unique=false),
    "SELECT a.actor_id FROM actor a UNION ALL SELECT c.customer_id FROM customer c UNION ALL SELECT f.film_id FROM film f"

    @info "intersect tables"
    @testsql intersect(map(actors, :last_name), map(customers, :last_name)),
    "SELECT a.last_name FROM actor a INTERSECT SELECT c.last_name FROM customer c"

    @info "intersect multiple tables"
    @testsql intersect(map(actors, :last_name), map(customers, :last_name), map(customers, :first_name)),
    "SELECT a.last_name FROM actor a INTERSECT SELECT c.last_name FROM customer c INTERSECT SELECT c.first_name FROM customer c"

    @info "subtract tables"
    @testsql setdiff(map(actors, :last_name), map(customers, :last_name); unique=false),
    "SELECT a.last_name FROM actor a EXCEPT ALL SELECT c.last_name FROM customer c"

    @info "multiple combination types"
    @testsql vcat(map(actors, :first_name), setdiff(map(customers, :first_name), map(actors, :last_name))),
    "SELECT a.first_name FROM actor a UNION (SELECT c.first_name FROM customer c EXCEPT SELECT a.last_name FROM actor a)"

    @info "literals"
    @testsql sort(t -> desc(t.num), vcat(query(map(Tuple, 1:5), (:num,)), query(map(Tuple, 6:10), (:num,)))),
    "SELECT q.num FROM 
    (SELECT v.num FROM (VALUES (1), (2), (3), (4), (5)) AS v (num) 
    UNION SELECT v.num FROM (VALUES (6), (7), (8), (9), (10)) AS v (num)) q
     ORDER BY q.num DESC"
end