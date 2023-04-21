import Base: filter, map, sort, join

Queryable = Union{TableDefinition,Query,QuerySet, SetReturningFunctionCall}

commontable(q::Queryable) = SubqueryTableItem(q)

ref(table::TableItem) = SelectQuery(SelectQuery(table); from=RefTableItem(table.ref))

tableresults(arg) = (arg,)
tableresults(arg::SelectQuery) = tableresults(arg.result)
tableresults(arg::UnmergedResult) = arg.results
tableresults(a, b) = (tableresults(a)..., tableresults(b)...)

query(from::Queryable) = SelectQuery(from)
query(f::SetReturningFunctionCall, fnames, ftypes) = SelectQuery(f, fnames, ftypes)
query(q::SelectQuery) = SelectQuery(SubqueryTableItem(q))
query(q::SelectQuery{UnmergedResult}) = error("unmerged result: $(q)")
query(q::QuerySet) = QuerySet(query(q.query), q.connection)
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
function filter(f::Function, q::SelectQuery)
    f = q.filter & convert(SQLExpression, f(tableresults(q)...))
    with_filter(q, f)
end
filter(f::Function, q::QuerySet) = QuerySet(filter(f, q.query), q.executor)
filter(f::Function) = (q) -> filter(f, q)



map(f::Function, node::Queryable) = map(f, SelectQuery(node))
map(f::Function, q::SelectQuery) = with_result(q, f(tableresults(q)...))
map(f::Function, q::QuerySet) = QuerySet(map(f, q.query), q.executor)
map(f::Function, q::CommonTableExpressionQuery) = CommonTableExpressionQuery(map(f, q.query), q.commontables...)
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

map(f::Function) = node -> map(f, node)

joinable(q::SelectQuery{UnmergedResult}) = error("cannot right join unmerged results")
joinable(q::SelectQuery) = joinable(q, q.from)
joinable(q::SelectQuery, from::JoinItem) = query(q)
joinable(q::SelectQuery, from::TableItem) = isgrouped(q) || ispaged(q) ? query(q) : q


function join(f::Function, left::Queryable, right::Queryable; type::JoinType=InnerJoin())
    left = convert(SelectQuery, left)
    right = joinable(convert(SelectQuery, right))
    results = tableresults(left, right)
    condition = convert(SQLExpression, f(results...))
    joinvalue = EquiJoin(type, condition)
    joinitem = JoinItem(left.from, right.from, joinvalue)
    filter = left.filter & right.filter
    SelectQuery(left; filter, from=joinitem, result=UnmergedResult(results))
end

function join(f::Function, left::QuerySet, right::Queryable; type::JoinType=InnerJoin())
    QuerySet(join(f, left.query, right; type), left.executor)
end

function join(f::Function, left::CommonTableExpressionQuery, right::Queryable; type::JoinType=InnerJoin())
    let query = join(f, left.query, right; type)
        CommonTableExpressionQuery(query, left.commontables...)
    end
end

function join(left::Queryable, right::Queryable)
    join((args...) -> true, left, right)
end

function join(left::Queryable, right::Queryable, pair::Pair{Symbol,Symbol}, morepairs::Pair{Symbol,Symbol}...)
    pairs = (pair, morepairs...)
    let f = (left, right) -> reduce(pairs; init=true) do acc, (lfield, rfield)
            acc & (getfield(left, lfield) == getfield(right, rfield))
        end
        join(f, left, right)
    end
end

function join(left::Queryable, right::Queryable, field::Symbol, morefields::Symbol...)
    fields = (field, morefields...)
    let f = (left, right) -> reduce(fields; init=true) do acc, field
            acc & (getfield(left, field) == getfield(right, field))
        end
        join(f, left, right)
    end
end

join(f::Function, right::Queryable) = (left::Queryable) -> join(f, left, right)
join(right::Queryable, field::Symbol, morefields::Symbol...) = (left::Queryable) -> join(left, right, field, morefields...)

function lateral_join(right::Function, left::Queryable; condition=(args...) -> true, type::JoinType=InnerJoin())
    left = convert(SelectQuery, left)
    right = query(right(tableresults(left)))
    results = tableresults(left, right)
    condition = convert(SQLExpression, f(results...))
    joinvalue = EquiJoin(type, condition)
    joinitem = JoinItem(left.from, right.from, joinvalue)
    filter = left.filter & right.filter
    SelectQuery(left; filter, from=joinitem, result=UnmergedResult(results))
end

function lateral_join(right::Function, left::QuerySet; condition=(args...) -> true, type::JoinType=InnerJoin())
    QuerySet(lateral_join(right, left.query; condition, type), left.executor)
end

groupby(f, node::Queryable) = groupby(f, convert(SelectQuery, node))
groupby(f::Function, q::SelectQuery) = with_group(q, f(tableresults(q)...))
groupby(f::Function, q::QuerySet) = QuerySet(groupby(f, q.query), q.executor)
groupby(q::Queryable, field::Symbol, morefields::Symbol...) =
    let fields = (field, morefields...)
        f = row -> map(field -> getfield(row, field), fields)
        groupby(f, q)
    end
groupby(f::Function) = (q::Queryable) -> groupby(f, q)
groupby(field::Symbol, morefields::Symbol...) = (q::Queryable) -> groupby(q, field, morefields...)

sort(f::Function, node::Queryable) = sort(f, convert(SelectQuery, node))
sort(f::Function, q::SelectQuery) = with_order(q, f(tableresults(q)...))
sort(f::Function, q::QuerySet) = QuerySet(sort(f, q.query), q.executor)
function sort(node::Queryable, field::Symbol, morefields::Symbol...)
    let fields = (field, morefields...)
        f = r -> map(f -> getfield(r, f), fields)
        sort(f, node)
    end
end
sort(f::Function) = q -> sort(f, q)
sort(field::Symbol, morefields::Symbol...) = q -> sort(q, field, morefields...)

function with(f::Function, commons::Queryable...)
    commontables = map(commontable, commons)
    query = f(map(ref, commontables)...)
    CommonTableExpressionQuery(query, commontables...)
end

function with(f::Function, arg::CommonTableExpressionQuery)
    next = commontable(arg.query)
    query = f(ref(next))
    CommonTableExpressionQuery(query, arg.commontables..., next)
end

with(f::Function, arg::QuerySet) = QuerySet(with(f, arg.query), arg.executor)

function iterate(it::Function, base::Queryable; unique=false)
    basetable = commontable(base)
    reftable = ref(basetable)
    iterateterm = SelectQuery(it(reftable))
    recurtable = RecursiveCommonTable(basetable, iterateterm, unique)
    CommonTableExpressionQuery(reftable, recurtable)
end

iterate(it::Function, base::QuerySet; unique=false) = QuerySet(iterate(it, base.query; unique), base.executor)