abstract type SQLNode end

include("./types/base.jl")

struct Asterisk <: SQLNode end
const All = Asterisk()

abstract type SQLExpression{T<:SQLType} <: SQLNode end

struct SQLConstant{T} <: SQLExpression{T}
    value
    type::Type{T}
end

SQLConstant(value) = SQLConstant(value, sqltypeclassof(value))

BooleanExpression = SQLExpression{BooleanType}
BooleanConstant = SQLConstant{BooleanType}
TextExpression = SQLExpression{<:CharacterType}

struct Cast{T} <: SQLExpression{T}
    expr::SQLExpression
    type::T
end


NodeList = Union{Tuple,NamedTuple}

include("sqltypeclassof.jl");
include("nodecompositionstyle.jl")
include("boolean.jl")
include("functions.jl")
include("tableitem.jl")
include("reference.jl")
include("joinitem.jl")
include("query.jl")
include("result.jl")
include("subquery.jl")
include("combinedquery.jl")
include("cte.jl")
include("convert.jl")
include("predicates.jl")
include("comparing.jl")
include("arithmetic.jl")
include("concat.jl")
include("rowstruct.jl")
include("aggregates.jl")