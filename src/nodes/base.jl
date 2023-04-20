abstract type SQLNode end

include("./types/base.jl")

struct AllOperand <: SQLNode end
const All = AllOperand()

abstract type SQLExpression{T<:SQLType} <: SQLNode end

struct SQLConstant{T} <: SQLExpression{T}
    value
    type::Type{T}
end

SQLConstant(value) = SQLConstant(value, sqltypeclassof(value))

struct Cast{T} <: SQLExpression{T}
    expr::SQLExpression
    type::T
end


NodeList = Union{Tuple,NamedTuple}

include("nodecompositionstyle.jl")
include("boolean.jl")
include("tableitem.jl")
include("functions.jl")
include("lateral.jl")
include("joinitem.jl")
include("query.jl")
include("result.jl")
include("subquery.jl")
include("combinedquery.jl")
include("cte.jl")
include("sqltypeclassof.jl")
include("convert.jl")
include("predicates.jl")
include("comparing.jl")
include("arithmetic.jl")
include("concat.jl")
include("aliashint.jl")
include("rowstruct.jl")
include("aggregates.jl")