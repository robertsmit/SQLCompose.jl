import Base: filter, map, sort, join, getindex, iterate


QuerySource = Union{Type{<:RowType},Type{<:RowStruct},TableSource}
Queryable = Union{Query,QuerySet,SetReturningFunctionCall,QuerySource}

include("update.jl")

Base.convert(::Type{Query}, value::Query) = value
Base.convert(::Type{Query}, value) = query(value)

commontable(q::Queryable) = SubqueryTableItem(q)
query_commontable(table::TableItem) = SelectQuery(SelectQuery(table); from=RefTableItem(table.ref))

result_args(arg) = (arg,)
result_args(arg::UnmergedResult) = arg.results
result_args(a, b) = (result_args(a)..., result_args(b)...)


query(from::Queryable) = SelectQuery(from)
query(from::Queryable, executor::AbstractQueryExecutor) = QuerySet(query(from), executor)
query(f::SetReturningFunctionCall, fnames, ftypes) = SelectQuery(f, fnames, ftypes)
query(q::SelectQuery) = SelectQuery(SubqueryTableItem(q))
query(q::SelectQuery{UnmergedResult}) = error("unmerged result: $(q)")
query(q::QuerySet) = QuerySet(query(q.query), q.executor)
query(values::AbstractVector{<:Tuple}, fieldnames::Tuple; aliashint=:v) =
    SelectQuery(ValuesTableItem(values, fieldnames, aliashint))
query(values::AbstractVector{T}; aliashint=:v) where {T<:Tuple} =
    let fieldnames = Tuple(Symbol("elem$i") for i in 1:length(T.types))
        query(values, fieldnames; aliashint)
    end
"""
    query(value)

Query a literal value

# Arguments
* `value`: A literal value

# Examples
```julia
julia> query(1)
SELECT 1
julia> query((1, 2, 3))
SELECT 1 as elem1, 2 as elem2, 3 as elem3
```

"""
query(value) = SelectWithoutFromQuery(value)

filter(f::Function, arg::Queryable) = filter(f, SelectQuery(arg))
function filter(f::Function, q::Union{SelectQuery,UpdateStatement})
    f = q.filter & convert(SQLExpression, f(result_args(q.result)...))
    with_filter(q, f)
end
filter(f::Function, q::QuerySet) = QuerySet(filter(f, q.query), q.executor)

map(f::Function, node::Queryable) = map(f, SelectQuery(node))
map(f::Function, q::SelectQuery) = with_result(q, convert_fields(SQLExpression, f(result_args(q.result)...)))
map(f::Function, q::QuerySet) = QuerySet(map(f, q.query), q.executor)
map(f::Function, q::CommonTableExpressionQuery) = CommonTableExpressionQuery(map(f, q.expression), q.commontables...)
map(f::Function, q::SelectWithoutFromQuery) = SelectWithoutFromQuery(f(q.result))

function map(q::Queryable, field::Symbol, morefields::Symbol...)
    fields = (field, morefields...)
    let f = row -> NamedTuple{fields}(map(field -> getfield(row, field), fields))
        map(f, q)
    end
end

function map(base::Queryable; kwargs...)
    if isempty(kwargs)
        return base
    end
    let f = row -> NamedTuple((key => getfield(row, value) for (key, value) in kwargs))
        map(f, base)
    end
end

JoinableLeft = Union{Queryable,UpdateStatement}
joinable_left(q::Queryable) = SelectQuery(q)
joinable_left(q::SelectQuery) = q
joinable_left(q::SQLCommand) = q
JoinableRight = Queryable
joinable_right(::SelectQuery{UnmergedResult}) = error("cannot right join unmerged results")
joinable_right(q::SelectQuery) = joinable_right(q, q.from)
joinable_right(q::SelectQuery, ::JoinItem) = query(q)
joinable_right(q::SelectQuery, ::TableItem) = isgrouped(q) || ispaged(q) ? query(q) : q
joinable_right(q::Queryable) = joinable_right(convert(SelectQuery, q))


function join(f::Function, left::JoinableLeft, right::JoinableRight; type::JoinType=InnerJoin())
    left = joinable_left(left)
    right = joinable_right(right)
    args = result_args(left.result, right.result)
    condition = convert(BooleanExpression, f(args...))
    filter = left.filter & right.filter
    result = result = UnmergedResult(args)
    make_join(left; right=right.from, condition, result, filter, type)
end

function make_join(left::SelectQuery; right, condition, result, filter, type)
    joinitem = JoinItem(left.from, right, EquiJoin(type, condition))
    SelectQuery(left; filter, from=joinitem, result)
end

function make_join(left::UpdateStatement; right, condition, result, filter, type)
    make_join(left, left.from, type; right, condition, result, filter)
end

function make_join(left::UpdateStatement, ::Nothing, ::InnerJoin; right, condition, result, filter)
    UpdateStatement(left; from=right, filter=filter & condition, result)
end

function make_join(left::UpdateStatement, ::Nothing, type::JoinType; right, condition, result, filter)
    error("Only inner joins are valid")
end

function make_join(stmnt::UpdateStatement, left::FromItem, type::JoinType; right, condition, result, filter)
    joinitem = JoinItem(left, right, EquiJoin(type, condition))
    UpdateStatement(stmnt; from=joinitem, filter, result)
end

function join(f::Function, left::QuerySet, right::JoinableRight; type::JoinType=InnerJoin())
    QuerySet(join(f, left.query, right; type), left.executor)
end

function join(f::Function, left::CommonTableExpressionQuery, right::JoinableRight; type::JoinType=InnerJoin())
    let query = join(f, left.expression, right; type)
        CommonTableExpressionQuery(query, left.commontables...)
    end
end

function join(left::JoinableLeft, right::JoinableRight)
    join((args...) -> true, left, right)
end

function join(left::JoinableLeft, right::JoinableRight, pair::Pair{Symbol,Symbol}, morepairs::Pair{Symbol,Symbol}...)
    pairs = (pair, morepairs...)
    let f = (left, right) -> reduce(pairs; init=true) do acc, (lfield, rfield)
            acc & (getfield(left, lfield) == getfield(right, rfield))
        end
        join(f, left, right)
    end
end

function join(left::JoinableLeft, right::JoinableRight, field::Symbol, morefields::Symbol...)
    fields = (field, morefields...)
    let f = (left, right) -> reduce(fields; init=true) do acc, field
            acc & (getfield(left, field) == getfield(right, field))
        end
        join(f, left, right)
    end
end

function join_lateral(rightf::Function, left::Queryable; on=(args...) -> true, type::JoinType=InnerJoin())
    left = convert(SelectQuery, left)
    right = rightf(result_args(left.result)...)
    right = query(right)
    results = result_args(left.result, result(right))
    condition = convert(SQLExpression, on(results...))
    joinvalue = LateralJoin(type, condition)
    joinitem = JoinItem(left.from, right.from, joinvalue)
    SelectQuery(left; from=joinitem, result=UnmergedResult(results))
end

left_join_lateral(rightf::Function, left::Queryable; kwargs...) =
    join_lateral(rightf::Function, left::Queryable; kwargs..., type=LeftJoin())

function join_lateral(right::Function, left::QuerySet; kwargs...)
    QuerySet(join_lateral(right, left.query; kwargs...), left.executor)
end

join_lateral(rightf::Function; kwargs...) = (left) -> join_lateral(rightf, left; kwargs...)

groupby(f, node::Queryable) = groupby(f, convert(SelectQuery, node))
groupby(f::Function, q::SelectQuery) =
    let groupval = f(result_args(q.result)...)
        with_group(q, convert_fields(SQLExpression, groupval) |> nodelist)
    end
groupby(f::Function, q::QuerySet) = QuerySet(groupby(f, q.query), q.executor)
groupby(q::Queryable, field::Symbol, morefields::Symbol...) =
    let fields = (field, morefields...)
        f = row -> map(field -> getfield(row, field), fields)
        groupby(f, q)
    end
groupby(f::Function) = (q::Queryable) -> groupby(f, q)
groupby(field::Symbol, morefields::Symbol...) = (q::Queryable) -> groupby(q, field, morefields...)

having(f::Function, arg::Queryable) = having(f, convert(SelectQuery, node))
function having(f::Function, q::SelectQuery)
    f = q.groupfilter & convert(SQLExpression, f(result_args(q.result)...))
    with_groupfilter(q, f)
end
having(f::Function, q::QuerySet) = QuerySet(having(f, q.query), q.executor)

sort(f::Function, node::Queryable) = sort(f, convert(SelectQuery, node))
sort(f::Function, q::SelectQuery) =
    let sortvalue = f(result_args(q.result)...)
        with_order(q, convert_fields(Union{SQLExpression,DescOrder}, sortvalue) |> nodelist)
    end
sort(f::Function, q::QuerySet) = QuerySet(sort(f, q.query), q.executor)
function sort(node::Queryable, field::Symbol, morefields::Symbol...)
    let fields = (field, morefields...)
        f = r -> map(f -> getfield(r, f), fields)
        sort(f, node)
    end
end

sort(field::Symbol, morefields::Symbol...) = q -> sort(q, field, morefields...)

function with(f::Function, commons::Queryable...)
    commontables = map(commontable, commons)
    query = f(map(query_commontable, commontables)...)
    CommonTableExpressionQuery(query, commontables...)
end

function with(f::Function, arg::CommonTableExpressionQuery)
    next = commontable(arg.expression)
    query = f(query_commontable(next))
    CommonTableExpressionQuery(query, arg.commontables..., next)
end

with(f::Function, arg::QuerySet) = QuerySet(with(f, arg.query), arg.executor)

function iterate(it::Function, base::Queryable; unique=false)
    basetable = commontable(base)
    reftable = query_commontable(basetable)
    iterateterm = SelectQuery(it(reftable))
    recurtable = RecursiveCommonTable(basetable, iterateterm, unique)
    CommonTableExpressionQuery(reftable, recurtable)
end

iterate(it::Function, base::QuerySet; unique=false) = QuerySet(iterate(it, base.query; unique), base.executor)

#range
getindex(q::Queryable, arg) = getindex(convert(SelectQuery, q), arg)
getindex(q::Queryable, ::Colon) = q
getindex(q::SelectQuery, ::Colon) = q
getindex(q::SelectQuery, i::Int) = getindex(q, TableRange(i - 1, 1))
getindex(q::SelectQuery; offset=0, limit=nothing) = getindex(q, TableRange(offset, limit))
getindex(q::SelectQuery, range::UnitRange) = getindex(q, TableRange(range.start - 1, range.stop - range.start + 1))
getindex(q::SelectQuery, range::TableRange) = with_range(q, range)

include("util.jl")
