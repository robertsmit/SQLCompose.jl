
#generic functions
struct FunctionCall{T} <: SQLExpression{T}
    name::Symbol
    operands::Tuple
end

Base.length(expr::SQLExpression{<:CharacterType}) = FunctionCall{Int8Type}(:length, (expr,))
Base.round(expr::SQLExpression{<:NumericType}; digits=0) = FunctionCall{NumericType}(:round, (expr, digits))
Base.string(expr::SQLExpression; pattern::String) = FunctionCall{TextType}(:to_char, (expr, pattern))