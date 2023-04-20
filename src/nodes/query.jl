#=
query:
- Julia version: 
- Author: Rob
- Date: 2022-04-25
=#
export desc, asc

abstract type Query <: SQLNode end
result(q::Query) = error("Please implement result for", typeof(q))

struct SelectWithoutFromQuery{T} <: Query
    result::T
end
result(q::SelectWithoutFromQuery) = q.result
with_result(::SelectWithoutFromQuery, arg) = SelectWithoutFromQuery(arg)

struct TableRange
    offset::UInt
    limit::Union{UInt,Nothing}
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
    from::Union{FromItem,FunctionCall}
    filter::BooleanExpression
    group::Tuple
    groupfilter::BooleanExpression
    order::Tuple
    range::TableRange
end

result(q::SelectQuery) = q.result

SelectQuery(query::SelectWithoutFromQuery) = SelectQuery(SubqueryTableItem(query))

function SelectQuery(from::ValuesTableItem{T}) where {T<:Tuple}
    fieldrefs = Tuple(TableItemFieldRef(n, sqltypeclassof(t), from.ref) for (n, t) in zip(from.fieldnames, T.types))
    result = NamedTuple{from.fieldnames}(fieldrefs)
    SelectQuery(result, from)
end

SelectQuery(result::T, from, filter=true, group=(), groupfilter=true, order=(), range=fullrange()) where {T} =
    SelectQuery{T}(result, from, filter, group, groupfilter, order, range)

isgrouped(query::SelectQuery) = !isempty(query.group)
ispaged(query::SelectQuery) = query.range !== fullrange()
isordered(query::SelectQuery) = !isempty(query.order)

function SelectQuery(table::TableDefinition)
    ref = TableItemRef(table.aliashint)
    result = NamedTuple{field_names(table)}(TableItemFieldRef(name, type, ref) for (name, type) in field_pairs(table))
    from = DefinedTableItem(ref, name(table))
    SelectQuery(result, from)
end

SelectQuery(other::SelectQuery;
    result=other.result, from=other.from, filter=other.filter, group=other.group, groupfilter=other.groupfilter, order=other.order, range=other.range) =
    SelectQuery(result, from, filter, group, groupfilter, order, range)

with_result(query::SelectQuery, arg) = SelectQuery(query; result=arg)
with_from(query::SelectQuery, arg) = SelectQuery(query; from=arg)
with_filter(query::SelectQuery, arg) = SelectQuery(query; filter=arg)
with_order(query::SelectQuery, value) = SelectQuery(query; order=nodelist(value))
with_group(query::SelectQuery, value) = SelectQuery(query; group=nodelist(value))
with_groupfilter(query::SelectQuery, value) = SelectQuery(query; groupfilter=value)
with_range(query::SelectQuery, value) = SelectQuery(query; range=value)


Base.convert(::Type{SelectQuery}, value::SelectQuery) = value
Base.convert(::Type{SelectQuery}, value) = SelectQuery(value)
Base.convert(::Type{Query}, value::Query) = value
Base.convert(::Type{Query}, value) = SelectQuery(value)
