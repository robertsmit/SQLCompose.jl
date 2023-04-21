import Base: *

struct Concat <: SQLExpression{TextType}
    expressions::NodeList
end

Concat(args::SQLExpression...) = Concat(args)
Concat(a::Concat, b::SQLExpression) = Concat((a.expressions..., b))
Concat(a::Concat, b::Concat) = Concat((a.expressions..., b.expressions...))
Concat(a::SQLExpression, b::Concat) = Concat((a, b.expressions...))



*(a::SQLExpression{<:CharacterType}, b::SQLExpression) = Concat(a, b)
*(a::SQLExpression{<:CharacterType}, b) = Concat(a, convert(SQLExpression, b))
Base.string(a::SQLExpression{<:CharacterType}, b, more...) = reduce(*, more; init= a * b)
