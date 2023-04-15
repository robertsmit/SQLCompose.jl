
#generic functions
struct FunctionCall{T} <: SQLExpression{T}
    name::Symbol
    operands::Tuple
end

Base.length(expr::SQLExpression{T}) where T <: CharacterType = FunctionCall{Int8Type}(:length, (expr,))

Base.sum(expr::SQLExpression{T}) where T <: NumericType = FunctionCall{Int8Type}(:sum, (expr,))