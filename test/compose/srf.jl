
@testset "set returning functions" begin
    function get_top_customers()
        type = RowType{Symbol(), (:customer_id, :total_revenue), Tuple{Int4Type, SQLCompose.NumericType}}
        SQLCompose.SetReturningFunctionCall{type}(:get_top_customers, ())
    end
    
    q = query(get_top_customers())
    @testsql q "SELECT g.customer_id, g.total_revenue FROM get_top_customers() g"


    @testsql (map(query([1,2,3])) do x
        unnest(x) + 3
        end), 
        "SELECT (unnest(ARRAY[1, 2, 3])) + 3 AS elem1"

    @testsql query(unnest([1,2,3])) "SELECT u.val FROM unnest(ARRAY[1, 2, 3]) u (val)"
end