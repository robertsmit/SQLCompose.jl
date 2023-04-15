include("./executor.jl")

mutable struct QuerySet
    query::Query
    executor::AbstractQueryExecutor
    result
    size
end

QuerySet(query::Query, executor::AbstractQueryExecutor) = QuerySet(query, executor, nothing, nothing)
QuerySet(qs::QuerySet, executor::AbstractQueryExecutor) = QuerySet(qs.query, executor)

execute(qs::QuerySet) = execute(qs.executor, qs.query)
getresult(qs::QuerySet) = getresult(qs, qs.result)
getresult(::QuerySet, result) = result
getresult(qs::QuerySet, ::Nothing) =
    let result = maprows(execute(qs), result(qs.query))
        qs.result = result
    end

maprows(rows, result) = [maprow(row, result) for row in rows]

function maprow(row, result)
    let mapfield = (_, alias) -> getproperty(row, Symbol(alias))
        mapfields(mapfield, result)
    end
end





SelectQuery(qs::QuerySet) = convert(SelectQuery, qs.query)
convert(::Query, qs::QuerySet) = qs.query

Base.show(io::IO, qs::QuerySet) = printpsql(io, qs.query)