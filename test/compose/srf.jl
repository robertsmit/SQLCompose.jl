
@testset "set returning functions" begin
    function get_top_customers()
        type = RowType{Symbol(), (:customer_id, :total_revenue), Tuple{Int4Type, SQLCompose.NumericType}}
        SQLCompose.SetReturningFunctionCall{type}(:get_top_customers, ())
    end
    
    q = query(get_top_customers())
    @testsql q "SELECT g.customer_id, g.total_revenue FROM get_top_customers() g"
end