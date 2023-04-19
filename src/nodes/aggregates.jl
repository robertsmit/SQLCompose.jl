
struct OrderedSetAggregateExpression{T} <: SQLExpression{T}
    name::Symbol
    operands::Tuple
    order::Tuple
    filter::BooleanExpression
end

struct AggregateExpression{T} <: SQLExpression{T}
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


aggregate(name::Symbol, type::Type{<:SQLType}, operands...; order=(), filter=true, distinct=false) =
    AggregateExpression{type}(name, distinct, operands, order, filter)


Base.count(expr::SQLExpression; distinct=false, order=(), filter=true) =
    aggregate(:count, Int8Type, expr; distinct, order, filter)
Base.count(; filter=true) = aggregate(:count, Int8Type; filter)


avg(expr::SQLExpression{<:NumericType}; distinct=false, order=(), filter=true) =
    aggregate(:avg, NumericType, expr; distinct, order, filter)

Base.sum(expr::SQLExpression{<:NumericType}; distinct=false, order=(), filter=true) =
    aggregate(:sum, NumericType, expr; distinct, order, filter)
Base.maximum(expr::SQLExpression{<:NumericType}; distinct=false, order=(), filter=true) =
    aggregate(:max, NumericType, expr; distinct, order, filter)
Base.minimum(expr::SQLExpression{<:NumericType}; distinct=false, order=(), filter=true) = 
    aggregate(:min, NumericType, expr; distinct, order, filter)
Base.join(expr::SQLExpression{<:CharacterType}, delim; distinct=false, order=(), filter=true) = 
    aggregate(:string_agg, CharacterType, expr, delim; distinct, order, filter)
Base.collect(expr::SQLExpression{T}; distinct=false, order=(), filter=true) where {T} =
    aggregate(:array_agg, ArrayType{T}, expr; distinct, order, filter)

count_over(expr; filter=true, partition=(), order=()) =
    WindowFunctionCall{Int8Type}(:count, expr; filter, partition, order)
