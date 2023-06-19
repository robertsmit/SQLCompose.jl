import Base.convert

convert(::Type{<:SQLExpression}, value::SQLExpression) = value

function convert(::Type{<:SQLExpression}, value::Query)
    SubqueryExpression(value)
end

convert(type::SQLType, value::SQLExpression) = Cast(value, type)

convert(::Type{<:SQLExpression}, value)   = SQLConstant(value)
convert(::Type{<:SQLExpression{T}}, value) where {T}  = SQLConstant(value, T)



