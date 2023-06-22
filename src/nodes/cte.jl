struct RecursiveCommonTable
    baseterm::SubqueryTableItem
    iterateterm::Query
    unique::Bool
end

CommonTable = Union{SubqueryTableItem,RecursiveCommonTable}

struct CommonTableExpressionQuery <: Query
    expression
    commontables::Tuple
    CommonTableExpressionQuery(query::Query, commontables::SubqueryTableItem...) = length(commontables) == 0 ? query : new(query, commontables)
    CommonTableExpressionQuery(query::Query, rec::RecursiveCommonTable, commontables::SubqueryTableItem...) = new(query, (rec, commontables...))
end
result(q::CommonTableExpressionQuery) = result(q.expression)

CommonTableExpressionQuery(query::CommonTableExpressionQuery, commontables::SubqueryTableItem...) = CommonTableExpressionQuery(query.expression, (commontables..., query.commontables...)...)

SelectQuery(query::CommonTableExpressionQuery) = SelectQuery(SubqueryTableItem(query))
