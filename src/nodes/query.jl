abstract type Query <: SQLNode end
result(q::Query) = error("Please implement result for", typeof(q))

struct SelectWithoutFromQuery{T} <: Query
    result::T
end
result(q::SelectWithoutFromQuery) = q.result
with_result(::SelectWithoutFromQuery, arg) = SelectWithoutFromQuery(arg)

struct TableRange
    offset::Int
    limit::Union{Int,Nothing}
end

fullrange() = TableRange(0, nothing)

nodelist(a::NodeList) = a
nodelist(a) = (a,)

struct DescOrder <: SQLNode
    expr::SQLExpression
end

DescOrder(arg::DescOrder) = arg.expr
desc(arg) = DescOrder(arg)
desc(arg::NodeList) = map(desc, arg)
asc(arg) = arg
asc(arg::NodeList) = map(arc, arg)
asc(arg::DescOrder) = arg.expr

struct SelectQuery{T} <: Query
    result::T
    from::FromItem
    filter::BooleanExpression
    group::Tuple
    groupfilter::BooleanExpression
    order::Tuple
    range::TableRange
end

SelectQuery(result::T, from, filter=true, group=(), groupfilter=true, order=(), range=fullrange()) where {T} =
    SelectQuery{T}(result, from, filter, group, groupfilter, order, range)
SelectQuery(other::SelectQuery;
    result=other.result, from=other.from, filter=other.filter, group=other.group, groupfilter=other.groupfilter, order=other.order, range=other.range) =
    SelectQuery(result, from, filter, group, groupfilter, order, range)

isgrouped(query::SelectQuery) = !isempty(query.group)
ispaged(query::SelectQuery) = query.range !== fullrange()
isordered(query::SelectQuery) = !isempty(query.order)
result(q::SelectQuery) = q.result

with_result(query::SelectQuery, arg) = SelectQuery(query; result=arg)
with_from(query::SelectQuery, arg) = query.from != arg ? SelectQuery(query; from=arg) : query
with_filter(query::SelectQuery, arg) = SelectQuery(query; filter=arg)
with_order(query::SelectQuery, value) = SelectQuery(query; order=nodelist(value))
with_group(query::SelectQuery, value) = SelectQuery(query; group=nodelist(value))
with_groupfilter(query::SelectQuery, value) = SelectQuery(query; groupfilter=value)
with_range(query::SelectQuery, value) = SelectQuery(query; range=value)

function SelectQuery(table::TableSource)
    from = DefinedTableItem(table)
    result = tableresult(from.ref, table.type)
    SelectQuery(result, from)
end

SelectQuery(query::SelectWithoutFromQuery) = SelectQuery(SubqueryTableItem(query))

function SelectQuery(from::ValuesTableItem{T}) where {T<:Tuple}    
    result = tableresult(from.ref, from.fieldnames, map(sqltypeclassof, T.types))
    SelectQuery(result, from)
end

# set returning function in from
begin
    SelectQuery(f::SetReturningFunctionCall{T}) where {T} = SelectQuery(f, (:val,), (T,))

    function SelectQuery(f::SetReturningFunctionCall{T}) where {T<:RowType}
        ref = TableItemRef()
        from = SetReturningFunctionTableItem(ref, (), f)
        SelectQuery(tableresult(ref, T), from)
    end

    function SelectQuery(f::SetReturningFunctionCall{T}, fnames::Tuple, ftypes::Tuple) where {T}    
        ref = TableItemRef()
        from = SetReturningFunctionTableItem(ref, fnames, f)
        result = tableresult(from.ref, fnames, ftypes)
        SelectQuery(result, from)
    end
end


Base.convert(::Type{SelectQuery}, value::SelectQuery) = value
Base.convert(::Type{SelectQuery}, value) = SelectQuery(value)
