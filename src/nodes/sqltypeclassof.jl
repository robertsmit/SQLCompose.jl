

sqltypeclassof(node::Union{TableItemFieldRef, SQLConstant, Cast}) = node.type
sqltypeclassof(node::SQLExpression{T}) where T = T
sqltypeclassof(::Type{T}) where T <: SQLType = T

function sqltypeclassof(l::NodeList) 
    if length(l) != 1 
        error("singleton list expected")
    end
    sqltypeclassof(first(l))
end

sqltypeclassof(query::Query) = subquerytypeof(query)