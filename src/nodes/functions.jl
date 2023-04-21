
#generic functions


abstract type FunctionCall{T} <: SQLExpression{T} end

FunctionCall{T}(name::Symbol) where T = ValueReturningFunctionCall{T}(name, ())
FunctionCall{T}(name::Symbol, operands::Tuple) where T = ValueReturningFunctionCall{T}(name, operands)
FunctionCall{T}(name::Symbol, operand) where T = FunctionCall{T}(name, (operand,))

struct ValueReturningFunctionCall{T} <: FunctionCall{T}
    name::Symbol
    operands::Tuple
end

struct SetReturningFunctionCall{T} <: FunctionCall{T}
    name::Symbol
    operands::Tuple
end

SetReturningFunctionCall{T}(name::Symbol) where T = SetReturningFunctionCall{T}(name, ())

Base.length(expr::SQLExpression{<:CharacterType}) = FunctionCall{Int8Type}(:length, expr)
Base.round(expr::SQLExpression{<:NumericType}; digits=0) = FunctionCall{NumericType}(:round, (expr, digits))
Base.string(expr::SQLExpression; pattern::String) = FunctionCall{TextType}(:to_char, (expr, pattern))