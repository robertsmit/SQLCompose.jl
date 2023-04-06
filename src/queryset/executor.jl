using LibPQ, Tables

abstract type AbstractQueryExecutor end

execute(::AbstractQueryExecutor, ::Query) = error("please implement: execute")

struct ConnectedQueryExecutor <: AbstractQueryExecutor
    connection::LibPQ.Connection
end

ConnectedQueryExecutor(connstr::String) = ConnectedQueryExecutor(LibPQ.Connection(connstr))

Base.close(executor::ConnectedQueryExecutor) = Base.close(executor.connection)



execute(executor::ConnectedQueryExecutor, query::Query) =
    let connection = executor.connection
        query = psqlstring(query)
        Tables.rows(LibPQ.execute(connection, query))
    end