
struct SubqueryTableItem <: TableItem
    ref::TableItemRef
    query::Query
end

function SubqueryTableItem(query::Query; aliashint::Symbol=:q)
    ref = TableItemRef(aliashint)
    SubqueryTableItem(ref, query)
end

struct SubqueryExpression{T} <: SQLExpression{T}
    query::Query
    type::Type{T}
end

SubqueryExpression(query::Query) = SubqueryExpression(query, subquerytypeof(query))

function subquerytypeof(query::Union{SelectQuery, SelectWithoutFromQuery})
    sqltypeclassof(query.result)
end

SubqueryTableItem(table::SubqueryTableItem) = table
SubqueryTableItem(table) = SubqueryTableItem(SelectQuery(table); aliashint=aliashint(table))

function SelectQuery(from::SubqueryTableItem)
    mapfield = let ref = from.ref
        (field, alias) -> TableItemFieldRef(Symbol(alias), sqltypeclassof(field), ref)
    end
    queryresult = result(from.query)
    mappedresult = mapfields(mapfield, queryresult)
    SelectQuery(mappedresult, from)
end











































































