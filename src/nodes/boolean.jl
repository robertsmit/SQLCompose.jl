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
		#Base.$op(::Nothing, ::Nothing) = nothing
		#Base.$op(left::Nothing, right::BooleanExpression) = right
		Base.$op(left::BooleanConstant, right::BooleanConstant) = SQLConstant(Base.$op(left.value, right.value))
		Base.$op(left::BooleanConstant, right::BooleanExpression) = left.value == $(identity) ? right : left
		Base.$op(left::BooleanExpression, right::BooleanConstant) = right.value == $(identity) ? left : right
		Base.$op(left::BooleanExpression, right::BooleanExpression) = $type(left, right)
		Base.$op(left, right::BooleanExpression) = Base.$op(convert(BooleanExpression, left), right)
		Base.$op(left::BooleanExpression, right) = Base.$op(left, convert(BooleanExpression, right))
	end
end

struct CaseClause{T <: SQLType}
	predicate::BooleanExpression
	consequence::SQLExpression{T}
end

CaseClause(predicate::BooleanExpression, consequence) = CaseClause(predicate, convert(SQLExpression, consequence))

struct CaseExpression{T <: SQLType} <: BooleanExpression
	clauses::AbstractVector{CaseClause{T}}
	otherwise::Union{SQLExpression{T}, Nothing}
	CaseExpression(clauses::AbstractVector{CaseClause{T}}, ::Nothing) where {T} = new{T}(clauses, nothing)
	CaseExpression(clauses::AbstractVector{CaseClause{T}}, otherwise) where {T} = new{T}(clauses, convert(SQLExpression{T}, otherwise))
end

CaseExpression(clause::CaseClause, otherwise) = CaseExpression(SA[clause], otherwise)

case(predicate::Bool, consequence, otherwise = nothing) = predicate ? consequence : otherwise
case(predicate::BooleanExpression, consequence, otherwise = nothing) =
	CaseExpression(CaseClause(predicate, consequence), otherwise)
case(predicate::BooleanExpression, consequence, otherwise::CaseExpression) =
	CaseExpression(SA[CaseClause(predicate, consequence), otherwise.clauses...], otherwise.otherwise)


macro nsc(expr)
	esc(non_short_circuit(expr))
end

non_short_circuit(expr::Any) = expr
function non_short_circuit(expr::Expr)
	nsc_args = map(non_short_circuit, expr.args)
	if expr.head in [:if, :elseif]
		Expr(:call, :case, nsc_args...)
	elseif expr.head == :&&
		Expr(:call, :&, nsc_args...)
	elseif expr.head == :||
		Expr(:call, :|, nsc_args...)
	else
		Expr(expr.head, nsc_args...)
	end
end

macro query(base, next)
	esc(:(@chain convert(SQLCompose.Query, $base) $(non_short_circuit(next))))
end
