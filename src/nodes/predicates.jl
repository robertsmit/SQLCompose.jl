import Base: isempty, ismissing, (:)

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

struct InExpression{T} <: BooleanExpression
    element
    set::T
end

Base.in(elem::SQLExpression, coll::Union{Query, AbstractVector}) = InExpression(elem, coll)


#between
struct BetweenRange
    left
    right
end

struct Between <: BooleanExpression
    subject
    range::BetweenRange
end


(:)(left::SQLExpression, right) = BetweenRange(left, right)
(:)(right, left::SQLExpression) = BetweenRange(left, right)
(:)(left::SQLExpression, right::SQLExpression) = BetweenRange(left, right)
Base.in(subject, range::BetweenRange) = Between(subject, range)
Base.in(subject::SQLExpression, range::AbstractRange) = Between(subject, BetweenRange(first(range), last(range)))
between(subject, inclusiveLower, inclusiveUpper) = Between(subject, BetweenRange(inclusiveLower, inclusiveUpper))
