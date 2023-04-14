import Base: !, |, &
import StaticArrays: SA

BooleanExpression = SQLExpression{BooleanType}
BooleanConstant = SQLConstant{BooleanType}

#not
struct Not <: BooleanExpression
    expr::BooleanExpression
end

Not(v::Not) = v.expr
Not(v::BooleanConstant) = SQLConstant(!v.value)
!(exp::BooleanExpression) = Not(exp)


#logic and / or
struct Or <: BooleanExpression
    left::BooleanExpression
    right::BooleanExpression
end

struct And <: BooleanExpression
    elems::AbstractVector{<:BooleanExpression}
end

head(a::And) = a.elems.head
tail(a::And) = a.elems.tail

And(e::BooleanExpression) = e
And(e::BooleanExpression, rest::BooleanExpression...) = And(SA[e, rest...])
And(left::And, right::BooleanExpression) = And(SA[left.elems..., right])
And(left::BooleanExpression, right::And) = And(SA[left, right.elems...])
And(left::And, right::And) = And(SA[left.elems..., right.elems...])


for (op, type, identity) in ((:|, Or, false), (:&, And, true))
    @eval begin
        Base.$op(::Nothing, ::Nothing) = nothing
        Base.$op(left::BooleanConstant, right::BooleanConstant) = BooleanConstant(Base.$op(left.value, right.value))
        Base.$op(left::Nothing, right::BooleanExpression) = right
        Base.$op(left::BooleanConstant, right::BooleanExpression) = left.value == $(identity) ? right : left
        Base.$op(left::BooleanExpression, right::BooleanConstant) = right.value == $(identity) ? left : right
        Base.$op(left::BooleanExpression, right::BooleanExpression) = $type(left, right)
        Base.$op(left, right::BooleanExpression) = Base.$op(convert(BooleanExpression, left), right)
        Base.$op(left::BooleanExpression, right) = Base.$op(left, convert(BooleanExpression, right))
    end
end