#=
combinedquery:
- Julia version: 
- Author: Rob
- Date: 2022-05-04
=#
abstract type QueryCombinatorType end

struct CombinedQuery{T<:QueryCombinatorType} <: Query
    left::Query
    right::Query
    type::T
    unique
end
result(q::CombinedQuery) = result(q.left)

combinators = (
    Union=(operator=:vcat, sqloperator="UNION"),
    Intersection=(operator=:intersect, sqloperator="INTERSECT"),
    Difference=(operator=:setdiff, sqloperator="EXCEPT")
)

needs_parentheses(child::CombinedQuery{T}, parent::CombinedQuery{T}) where {T<:QueryCombinatorType} = false
needs_parentheses(child::SelectQuery, ::CombinedQuery) = isordered(child) || ispaged(child)

#gen
for (combinator, (op, sqlop)) in pairs(combinators)
    combinatortype = Symbol("Query$combinator")
    @eval begin
        struct $combinatortype <: QueryCombinatorType
        end
        Base.$op(left::Query, right::Query; unique=true) = CombinedQuery(left, right, $combinatortype(), unique)
        Base.$op(left::Query, right::Query, rest::Query...; unique=true) = Base.$op(left, (Base.$op(right, rest...; unique));unique)
        function printpsql(io::IO, node::CombinedQuery{$combinatortype}, env)            
            printpsql(io, node.left, node, env)
            println(io, env)
            print(io, $sqlop)
            node.unique || print(io, " ALL")
            println(io, env)
            printpsql(io, node.right, node, env)
        end
    end
end

SelectQuery(query::CombinedQuery) = SelectQuery(SubqueryTableItem(query))

