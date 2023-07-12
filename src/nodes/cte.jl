struct RecursiveCommonTable
    baseterm::SubqueryTableItem
    iterateterm::Query
    unique::Bool
end

CommonTable = Union{SubqueryTableItem,RecursiveCommonTable}

struct CommonTableExpressionQuery <: Query
    expression
    commontables::Tuple
    CommonTableExpressionQuery(expression, commontables::SubqueryTableItem...) = length(commontables) == 0 ? expression : new(expression, commontables)
    CommonTableExpressionQuery(expression, rec::RecursiveCommonTable, commontables::SubqueryTableItem...) = new(expression, (rec, commontables...))
end
result(q::CommonTableExpressionQuery) = result(q.expression)

CommonTableExpressionQuery(query::CommonTableExpressionQuery, commontables::SubqueryTableItem...) = CommonTableExpressionQuery(query.expression, (commontables..., query.commontables...)...)

SelectQuery(query::CommonTableExpressionQuery) = SelectQuery(SubqueryTableItem(query))
