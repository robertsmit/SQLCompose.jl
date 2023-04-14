
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

AggregateExpression{T}(name::Symbol, operands::Tuple = (); order=(), filter=true, distinct=false) where T = 
    AggregateExpression{T}(name, distinct, operands, order, filter)

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


Base.count(expr::SQLExpression; distinct=false, order=(), filter=true) =
    AggregateExpression{Int8Type}(:count, distinct, (expr,), order, filter)
Base.count(::AllOperand; filter=true) = AggregateExpression{Int8Type}(:count; filter)

count_over(expr; filter=true, partition=(), order=()) =
    WindowFunctionCall{Int8Type}(:count, expr; filter, partition, order)
