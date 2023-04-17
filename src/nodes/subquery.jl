
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
SubqueryTableItem(table::Union{TableItem,TableDefinition}) = SubqueryTableItem(SelectQuery(table); aliashint=aliashint(table))

unordered(query::SelectQuery) = isnothing(query.order) ? query : with_order(query, nothing)
unordered(query::Query) = query

function SelectQuery(from::SubqueryTableItem)
    mapfield = let ref = from.ref
        (field, alias) -> TableItemFieldRef(Symbol(alias), sqltypeclassof(field), ref)
    end
    result = mapfields(mapfield, from.query)
    SelectQuery(result, from)
end

#maps result in same structure 
mapfields(f::Function, query::Query) = mapfields(f, result(query))
mapfields(f::Function, result) = mapfields(f, result, nothing)
mapfields(f::Function, result::T, alias) where {T} = mapfields(f::Function, result, alias, NodeCompositionStyle(T), )
mapfields(f::Function, field, alias, ::NodeElement) = f(field, fieldalias(field, alias))
mapfields(f::Function, field, alias, ::NodeStructure) = error("Please implement mapfields function for", typeof(field))

mapfields(f::Function, result::Tuple, alias) = Tuple(mapfields(f, x, nextalias(alias, i)) for (i, x) in pairs(result))
mapfields(f::Function, result::NamedTuple{K}, alias) where K = NamedTuple{K}(mapfields(f, x, nextalias(alias, i)) for (i, x) in pairs(result))











































































