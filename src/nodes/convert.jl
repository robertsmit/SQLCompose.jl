import Base.convert

convert(::Type{T}, value::SQLExpression) where T <: SQLExpression  = value

function convert(::Type{T}, value::Query) where T <: SQLExpression 
    SubqueryExpression(value)
end

convert(type::SQLType, value::SQLExpression) = Cast(value, type)

convert(::Type{T}, value) where T <: SQLExpression = SQLConstant(value)