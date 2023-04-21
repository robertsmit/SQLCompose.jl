

sqltypeclassof(x::T) where {T} = sqltypeclassof(T)
sqltypeclassof(x::DataType) = error("SQL type class not implemented for: ", x)
sqltypeclassof(::Type{Vector{T}}) where T = ArrayType{sqltypeclassof(T)}
sqltypeclassof(::Type{Bool}) = BooleanType
sqltypeclassof(::Type{Int8}) = Int2Type
sqltypeclassof(::Type{Int16}) = Int2Type
sqltypeclassof(::Type{Int32}) = Int4Type
sqltypeclassof(::Type{Int64}) = Int8Type
sqltypeclassof(::Type{Float16}) = Float4Type
sqltypeclassof(::Type{Float32}) = Float4Type
sqltypeclassof(::Type{Float64}) = Float8Type
sqltypeclassof(::Type{String}) = TextType
sqltypeclassof(::Type{UUID}) = UUIDType