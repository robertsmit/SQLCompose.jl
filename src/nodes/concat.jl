import Base: *

struct Concat <: SQLExpression{TextType}
    expressions::NodeList
end

Concat(args::SQLExpression...) = Concat(args)
Concat(a::Concat, b::SQLExpression) = Concat((a.expressions..., b))
Concat(a::Concat, b::Concat) = Concat((a.expressions..., b.expressions...))
Concat(a::SQLExpression, b::Concat) = Concat((a, b.expressions...))



*(a::TextExpression, b::TextExpression) = Concat(a, b)
*(a::TextExpression, b) = Concat(a, convert(TextExpression, b))
*(a, b::TextExpression) = Concat(convert(TextExpression, a), b)
Base.string(a::SQLExpression{<:CharacterType}, b, more...) = reduce(*, more; init= a * b)
