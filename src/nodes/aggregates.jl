
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



WindowFunctionCall{T}(name, operands...; filter=true, order=(), partition=()) where T =
    WindowFunctionCall{T}(name, operands, filter, WindowDefinition(partition, order))


aggregate(name::Symbol, type, operands...;order=(), filter=true, distinct=false) = 
    AggregateExpression{type}(name, distinct, operands, order, filter)

Base.count(expr::SQLExpression; distinct=false, order=(), filter=true) =
    aggregate(:count, Int8Type, expr; distinct, order, filter)
Base.count(; filter=true) = aggregate(:count, Int8Type; filter)

count_over(expr; filter=true, partition=(), order=()) =
    WindowFunctionCall{Int8Type}(:count, expr; filter, partition, order)
