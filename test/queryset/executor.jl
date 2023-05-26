struct MockQueryExecutor <: SQLCompose.AbstractQueryExecutor
    data::AbstractVector
end

function SQLCompose.execute(executor::MockQueryExecutor, query::SQLCompose.Query) 
    function makerow(data::Tuple)
        row = []
        SQLCompose.foreach_field(SQLCompose.result(query)) do field, alias, index
            push!(row, Symbol(alias) => data[index])
        end
        NamedTuple(row)
    end
    (makerow(executor.data[i]) for i in 1:length(executor.data))
end
    
SQLCompose.close(executor::MockQueryExecutor) = nothing