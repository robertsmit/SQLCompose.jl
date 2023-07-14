import Base: !, |, &
import StaticArrays: SA

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

And(e::BooleanExpression) = e
And(e::BooleanExpression, rest::BooleanExpression...) = And(SA[e, rest...])
And(left::And, right::BooleanExpression) = And(SA[left.elems..., right])
And(left::BooleanExpression, right::And) = And(SA[left, right.elems...])
And(left::And, right::And) = And(SA[left.elems..., right.elems...])


for (op, type, identity) in ((:|, Or, false), (:&, And, true))
	@eval begin	
		Base.$op(left::BooleanConstant, right::BooleanConstant) = SQLConstant(Base.$op(left.value, right.value))
		Base.$op(left::BooleanConstant, right::BooleanExpression) = left.value == $(identity) ? right : left
		Base.$op(left::BooleanExpression, right::BooleanConstant) = right.value == $(identity) ? left : right
		Base.$op(left::BooleanExpression, right::BooleanExpression) = $type(left, right)
		Base.$op(left, right::BooleanExpression) = Base.$op(convert(BooleanExpression, left), right)
		Base.$op(left::BooleanExpression, right) = Base.$op(left, convert(BooleanExpression, right))
	end
end

struct CaseClause{T <: SQLType} <: SQLNode
	predicate::BooleanExpression
	consequence::SQLExpression{T}
end

CaseClause(predicate::BooleanExpression, consequence) = CaseClause(predicate, convert(SQLExpression, consequence))

struct CaseExpression{T <: SQLType} <: SQLExpression{T}
	clauses::AbstractVector{CaseClause{<:T}}
	otherwise::Union{SQLExpression{<:T}, Nothing}
	CaseExpression(clauses::AbstractVector{CaseClause{T}}, ::Nothing) where {T} = new{T}(clauses, nothing)
	CaseExpression(clauses::AbstractVector{CaseClause{T1}}, otherwise::SQLExpression{T2}) where {T1, T2} = new{promote_type(T1,T2)}(clauses, otherwise)
end

CaseExpression(clause::CaseClause, otherwise) = CaseExpression(SA[clause], otherwise)

case(predicate::Bool, consequence, otherwise = nothing) = predicate ? consequence : otherwise
case(predicate::BooleanExpression, consequence, otherwise) =
	CaseExpression(CaseClause(predicate, consequence), convert(SQLExpression, otherwise))
case(predicate::BooleanExpression, consequence, ::Nothing = nothing) =
	CaseExpression(CaseClause(predicate, consequence), nothing)
case(predicate::BooleanExpression, consequence, otherwise::CaseExpression) =
	CaseExpression(SA[CaseClause(predicate, consequence), otherwise.clauses...], otherwise.otherwise)

