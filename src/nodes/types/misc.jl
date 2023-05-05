import Base.names

struct BooleanType <: SQLType end

struct UUIDType <: SQLType end

struct JSONType <: SQLType end

"A binary string, a sequence of octets (or bytes)."
struct BlobType <: SQLType end

struct UnknownType <: SQLType end

struct ArrayType{T<:SQLType} <: SQLType
    eltype::T
end

struct EnumType <: SQLType
    name
end