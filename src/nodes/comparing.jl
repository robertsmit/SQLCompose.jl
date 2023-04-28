
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