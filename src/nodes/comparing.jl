
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

for (name, (operator, ci_operator, antogonist)) in pairs((
    Like=(operator="LIKE", ci_operator="ILIKE", antogonist=:NotLike),
    NotLike=(operator="NOT LIKE", ci_operator="NOT ILIKE", antogonist=:Like),
    RegexMatch=(operator="~", ci_operator="~*", antogonist=:NotRegexMatch),
    NotRegexMatch=(operator="!~", ci_operator="!~*", antogonist=:RegexMatch)))
    typename = Symbol(name, "Expression")
    @eval begin
        struct $typename <: BooleanExpression
            subject::SQLExpression
            pattern::SQLExpression{<:CharacterType}
            casesensitive::Bool
        end
        $typename(subject, pattern, casesensitive) =
            $typename(convert(SQLExpression, subject), convert(SQLExpression, pattern), casesensitive)
        Not(arg::$typename) = $antogonist(arg.subject, arg.pattern, arg.casesensitive)
        function printpsql(io::IO, node::$typename, env)
            printpsql(io, node.subject, node, env)
            print(io, " ")
            print(io, node.casesensitive ? $operator : $ci_operator)
            print(io, " ")
            printpsql(io, node.pattern, node, env)
        end
        function write_referredtable_location_plan!(plan, node::$typename, tableitem)
            write_referredtable_location_plan!(plan, node.subject, tableitem)
            write_referredtable_location_plan!(plan, node.pattern, tableitem)
        end
    end
end

Base.occursin(pattern::String, subject::SQLExpression; casesensitive=true) =
    LikeExpression(subject, "%$(pattern)%", casesensitive)
Base.occursin(r::Regex, subject::SQLExpression; casesensitive=true) =
    RegexMatchExpression(subject, string(r), casesensitive)