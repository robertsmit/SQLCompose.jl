@info "Running values tests"
@testset "values" begin
    @info "values table"
    table = [(1, "row1"), (2, "row2")]
    q = query(table, (:id, :name))
    #select first row on name
    q = filter(t -> t.name == "row1", q)
    @test string(q) === "SELECT v.id, v.name FROM (VALUES (1, 'row1'), (2, 'row2')) AS v (id, name) WHERE v.name = 'row1'"

    @info "values table: default aliases"
    q = query(table)
    @test string(q) === "SELECT v.elem1, v.elem2 FROM (VALUES (1, 'row1'), (2, 'row2')) AS v (elem1, elem2)"
    q = query((1,2,3,4))
    q = filter(t -> t[1] == 1, q)
    @test string(q) === "SELECT q.elem1, q.elem2, q.elem3, q.elem4 FROM (SELECT 1 AS elem1, 2 AS elem2, 3 AS elem3, 4 AS elem4) q WHERE q.elem1 = 1"
    q = query((a=1,b=2,c=3,d=4))
    q = map(t -> (t..., d = t.d + 1), q)
    @test string(q) === "SELECT 1 AS a, 2 AS b, 3 AS c, 5 AS d"
    q = query(1)
    @testsql q "SELECT 1 AS elem1"
    q = map(x -> x + 1, q)
    @testsql q "SELECT 2 AS elem1"
    nested = map(query(query(1))) do x; x + 1; end
    @testsql nested  "SELECT q.elem1 + 1 AS elem1 FROM (SELECT 1 AS elem1) q"
    @testsql query(nested) "SELECT q.elem1 FROM (SELECT q.elem1 + 1 AS elem1 FROM (SELECT 1 AS elem1) q) q"

end

@testset "set returning functions" begin

    type = RowType{:get_top_customers, (:customer_id, :total_revenue), Tuple{Int4Type, SQLCompose.NumericType}}
    call = SQLCompose.FunctionCall{type}(:get_top_customers, ())

    # @testsql query(SQLCompose.FunctionCall{RowType{(:customer_id, :total_revenue,)}()}(:get_top_customers, ())) ""
end

