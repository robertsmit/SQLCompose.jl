
abstract type AbstractAggregateExpression{T} <: SQLExpression{T} end

struct OrderedSetAggregateExpression{T} <: AbstractAggregateExpression{T}
    name::Symbol
    operands::Tuple
    order::Tuple
    filter::BooleanExpression
end

struct AggregateExpression{T} <: AbstractAggregateExpression{T}
    name::Symbol
    distinct::Bool
    operands::Tuple
    order::Tuple
    filter::BooleanExpression
end



struct WindowDefinition
    partition::Tuple
    order::Tuple
end

struct WindowFunctionCall{T} <: SQLExpression{T}
    name::Symbol
    operands::Tuple
    filter::BooleanExpression
    window::WindowDefinition
end

struct DefinedFunction{T<:SQLType}
    name::Symbol
end

WindowFunctionCall{T}(name, operands...; filter=true, order=(), partition=()) where {T} =
    WindowFunctionCall{T}(name, operands, filter, WindowDefinition(partition, order))


aggregate(name::Symbol, type::Type{<:SQLType}, operands...; sort=(), filter=true, unique=false) =
    AggregateExpression{type}(name, unique, operands, sort, filter)


Base.count(expr::SQLExpression; unique=false, sort=(), filter=true) =
    aggregate(:count, Int8Type, expr; unique, sort, filter)
Base.count(::Asterisk; filter=true) = aggregate(:count, Int8Type; filter)


avg(expr::SQLExpression{<:NumericType}; unique=false, sort=(), filter=true) =
    aggregate(:avg, NumericType, expr; unique, sort, filter)

Base.sum(expr::SQLExpression{<:NumericType}; unique=false, sort=(), filter=true) =
    aggregate(:sum, NumericType, expr; unique, sort, filter)
Base.maximum(expr::SQLExpression{<:NumericType}; unique=false, sort=(), filter=true) =
    aggregate(:max, NumericType, expr; unique, sort, filter)
Base.minimum(expr::SQLExpression{<:NumericType}; unique=false, sort=(), filter=true) = 
    aggregate(:min, NumericType, expr; unique, sort, filter)
Base.join(expr::SQLExpression{<:CharacterType}, delim; unique=false, sort=(), filter=true) = 
    aggregate(:string_agg, CharacterType, expr, delim; unique, sort, filter)
Base.collect(expr::SQLExpression{T}; unique=false, sort=(), filter=true) where {T} =
    aggregate(:array_agg, ArrayType{T}, expr; unique, sort, filter)


count_over(expr; filter=true, partition=(), sort=()) =
    WindowFunctionCall{Int8Type}(:count, expr; filter, partition, sort)
