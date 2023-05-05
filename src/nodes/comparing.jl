
#comparing model

comparators = (
    Equal=(name=:(==), sqlname="=", antogonist=:NotEqual),
    NotEqual=(name=:(!=), sqlname="<>", antogonist=:Equal),
    IsLess=(name=:(<), sqlname="<", antogonist=:GreaterOrEqual),
    GreaterOrEqual=(name=:(>=), sqlname=">=", antogonist=:Less),
    Greater=(name=:(>), sqlname=">", antogonist=:LessOrEqual),
    LessOrEqual=(name=:(<=), sqlname="<=", antogonist=:Greater),
    IsNotDistinctFrom=(name=:isequal, sqlname="IS NOT DISTINCT FROM", antogonist=:IsDistinctFrom),
    IsDistinctFrom=(name=nothing, sqlname="IS DISTINCT FROM", antogonist=:IsNotDistinctFrom)
)

#gen structs
for (typename, (op, sqloperator, antogonist)) in pairs(comparators)
    @eval begin
        struct $typename <: BooleanExpression
            left::SQLExpression
            right::SQLExpression
        end
        Not(arg::$typename) = $antogonist(arg.left, arg.right)
        printpsql(io::IO, node::$typename, env) = printpsql_infix(io, node, $sqloperator, env)
        function write_referredtable_location_plan!(plan, node::$typename, tableitem)
            write_referredtable_location_plan!(plan, node.left, tableitem)
            write_referredtable_location_plan!(plan, node.right, tableitem)
        end
    end

    if !isnothing(op)
        @eval begin
            Base.$op(left::SQLConstant, right::SQLConstant) = SQLConstant(Base.$op(left.value, right.value))
            Base.$op(left::SQLExpression, right::SQLExpression) = $typename(left, right)
            Base.$op(left, right::SQLExpression) = Base.$op(convert(SQLExpression, left), right)
            Base.$op(left::SQLExpression, right) = Base.$op(left, convert(SQLExpression, right))
        end
    end
end

abstract type MatchPattern end

struct LikeMatchPattern <: MatchPattern
    value::TextExpression
    casesensitive::Bool
end

struct RegexMatchPattern <: MatchPattern
    value::TextExpression
    casesensitive::Bool
end

struct SimilarToMatchPattern <: MatchPattern
    value::TextExpression
end

for (name, (operator, ci_operator, antogonist, patterntype)) in pairs((
    Like=(operator="LIKE", ci_operator="ILIKE", antogonist=:NotLike, patterntype=:LikeMatchPattern),
    NotLike=(operator="NOT LIKE", ci_operator="NOT ILIKE", antogonist=:Like, patterntype=:LikeMatchPattern),
    RegexMatch=(operator="~", ci_operator="~*", antogonist=:NotRegexMatch, patterntype=:RegexMatchPattern),
    NotRegexMatch=(operator="!~", ci_operator="!~*", antogonist=:RegexMatch, patterntype=:RegexMatchPattern),
    SimilarTo=(operator="SIMILAR TO", ci_operator=nothing, antogonist=:NotSimilarTo, patterntype=:SimilarToMatchPattern),
    NotSimilarTo=(operator="NOT SIMILAR TO", ci_operator=nothing, antogonist=:SimilarTo, patterntype=:SimilarToMatchPattern)
))

    gettypename(name) = Symbol(name, "Expression")
    typename = gettypename(name)
    @eval begin
        struct $typename <: BooleanExpression
            subject::TextExpression
            pattern::$patterntype
        end
        Not(arg::$typename) = $(gettypename(antogonist))(arg.subject, arg.pattern)
        function printpsql(io::IO, node::$typename, env)
            let pattern = node.pattern
                printpsql(io, node.subject, node, env)
                print(io, " ")                
                print(io, $(isnothing(ci_operator) ? operator : :(pattern.casesensitive ? $operator : $ci_operator)))
                print(io, " ")
                printpsql(io, pattern.value, node, env)
            end
        end
        function write_referredtable_location_plan!(plan, node::$typename, tableitem)
            write_referredtable_location_plan!(plan, node.subject, tableitem)
            write_referredtable_location_plan!(plan, node.pattern.value, tableitem)
        end
    end
end


macro like_str(v)
    return LikeMatchPattern(v, true)
end

macro ilike_str(v)
    return LikeMatchPattern(v, false)
end

macro similarto_str(v)
    return SimilarToMatchPattern(v)
end

like(pattern::SQLExpression, casesensitive=true) = LikeMatchPattern(pattern, casesensitive)
ilike(pattern::SQLExpression) = like(pattern, false)
similarto(pattern::SQLExpression) = SimilarToMatchPattern(pattern)
regex(pattern::SQLExpression, casesensitive=true) = RegexMatchPattern(pattern, casesensitive)

Base.occursin(needle::String, haystack::TextExpression; casesensitive=true) =
    let
        escaped_needle = replace(needle, "%" => "\\%")
        occursin(LikeMatchPattern("%$(escaped_needle)%", casesensitive), haystack)
    end

Base.occursin(needle::LikeMatchPattern, haystack::TextExpression) =
    LikeExpression(haystack, needle)
Base.occursin(needle::RegexMatchPattern, haystack::TextExpression) = RegexMatchExpression(haystack, needle)
Base.occursin(needle::SimilarToMatchPattern, haystack::TextExpression) = SimilarToExpression(haystack, needle)

Base.occursin(needle::Regex, haystack::TextExpression; casesensitive=true) = occursin(RegexMatchPattern(needle.pattern, casesensitive), haystack)
Base.occursin(needle::TextExpression, haystack; casesensitive=true) = occursin(LikeMatchPattern("%" * needle * "%", casesensitive), haystack)

Base.contains(haystack::TextExpression, needle) = occursin(needle, haystack)
Base.contains(haystack::String, needle::TextExpression) = occursin(needle, haystack)
