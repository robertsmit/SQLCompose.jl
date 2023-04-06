import Base: isempty, ismissing, length, sum

#semi join / anti join
struct Exists <: BooleanExpression
    query::SelectQuery
end

struct NotExists <: BooleanExpression
    query::SelectQuery
    NotExists(query) = new(SelectQuery(query;result = 1))
end

isempty(arg::SelectQuery) = NotExists(arg)
Not(arg::NotExists) = Exists(arg.query)
Not(arg::Exists) = NotExists(arg.query)

# is null / is not null
struct IsNull <: BooleanExpression
    expr::SQLExpression
end

struct IsNotNull <: BooleanExpression
    expr::SQLExpression
end

ismissing(v::SQLExpression) = IsNull(v)
Not(v::IsNull) = IsNotNull(v.expr)
Not(v::IsNotNull) = IsNull(v.expr)

#generic functions

struct Operator{T<:SQLType}
    name::Symbol
    type::T
end

struct FunctionCall{T} <: SQLExpression{T}
    operator::Operator{T}
    operands::Tuple
end

FunctionCall{T}(op::Symbol, operands...) where T <: SQLType = FunctionCall(Operator{T}(op, T()), operands...)

length(expr::SQLExpression{T}) where T <: CharacterType = FunctionCall{Int8Type}(:length, (expr,))

sum(expr::SQLExpression{T}) where T <: NumericType = FunctionCall{Int8Type}(:sum, (expr,))


