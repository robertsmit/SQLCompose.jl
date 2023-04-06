
#comparing model
comparators = (
    Equal = (operator = :(==), sqloperator = "=", antogonist = :NotEqual),
    NotEqual = (operator = :(!=), sqloperator = "<>", antogonist = :Equal),
    IsLess = (operator = :(<), sqloperator = "<", antogonist = :GreaterOrEqual),
    GreaterOrEqual = (operator = :(>=), sqloperator = ">=", antogonist = :Less),
    Greater = (operator = :(>), sqloperator = ">", antogonist = :LessOrEqual),
    LessOrEqual = (operator = :(<=), sqloperator = "<=", antogonist = :Greater),
)

#gen structs
for (typename, (op, sqloperator, antogonist)) in pairs(comparators)
    @eval begin
        struct $typename <: BooleanExpression
            left::SQLExpression
            right::SQLExpression
        end
        Not(arg::$typename) = $antogonist(arg.left, arg.right)
        Base.$op(left::SQLConstant, right::SQLConstant) = SQLConstant(Base.$op(left.value, right.value))
        Base.$op(left::SQLExpression, right::SQLExpression) = $typename(left, right)
        Base.$op(left, right::SQLExpression) = Base.$op(convert(SQLExpression, left), right)
        Base.$op(left::SQLExpression, right) = Base.$op(left, convert(SQLExpression, right))
        printpsql(io::IO, node::$typename, env) = printpsql_infix(io, node, $sqloperator, env)
        function writelateralplan!(plan, node::$typename, tableitem)
            writelateralplan!(plan, node.left, tableitem)
            writelateralplan!(plan, node.right, tableitem)
        end
    end
end