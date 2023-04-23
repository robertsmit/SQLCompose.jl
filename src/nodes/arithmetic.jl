NumericExpression = SQLExpression{<:NumericType}

abstract type NumericOperation{T<:NumericType} <: SQLExpression{T} end

precedence(::NumericOperation) = 0

needs_parentheses(child::NumericOperation, parent::NumericOperation) =
    let p = precedence(parent), c = precedence(child)
        p == 0 || c == 0 || p < c
    end

operators = (
    NumericAddition=(operator=:+, sqloperator="+", type=NumericType, precedence=3),
    NumericSubtraction=(operator=:-, sqloperator="-", type=NumericType, precedence=3),
    NumericMultiplication=(operator=:*, sqloperator="*", type=NumericType, precedence=2),
    NumericIntegerDivision=(operator=:÷, sqloperator="/", type=IntegerType, precedence=2),
    NumericRemainder=(operator=:%, sqloperator="%", type=IntegerType, precedence=2),
    NumericExponentiation=(operator=:^, sqloperator="^", type=NumericType, precedence=1),
)

#gen
for (typename, (op, sqloperator, type, prec)) in pairs(operators)
    @eval begin
        struct $typename <: NumericOperation{$type}
            left::NumericExpression
            right::NumericExpression
        end
        precedence(::$typename) = $prec
        Base.$op(left::SQLConstant{<:NumericType}, right::SQLConstant{<:NumericType}) = SQLConstant(Base.$op(left.value, right.value))
        Base.$op(left::NumericExpression, right::NumericExpression) = $typename(left, right)
        Base.$op(left, right::NumericExpression) = Base.$op(convert(SQLExpression, left), right)
        Base.$op(left::NumericExpression, right) = Base.$op(left, convert(SQLExpression, right))

        printpsql(io::IO, node::$typename, env) = printpsql_infix(io, node, $(Meta.quot(sqloperator)), env)
        function writelateralplan!(plan, node::$typename, tableitem)
            writelateralplan!(plan, node.left, tableitem)
            writelateralplan!(plan, node.right, tableitem)
        end
    end
end
