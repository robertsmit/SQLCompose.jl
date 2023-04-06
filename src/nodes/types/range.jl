struct RangeType{T <: SQLType} <: SQLType
    elemtype::T
end