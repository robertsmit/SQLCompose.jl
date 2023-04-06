module Generate
using ..SQLCompose: aliashintdefault, RowType, BooleanType, Int2Type, Int4Type, Int8Type, Float4Type,
    Float8Type, DecimalType, IntervalType, TimestampType, DateType, TimeType, BlobType,
    CharType, VarCharType, TextType, UUIDType, JSONType, UnknownType, ArrayType, EnumType
import ..SQLCompose: name, field_names, field_pairs

using LibPQ, Tables

export generate, RelationType, ForeignKey, queries_expression

include("pg_catalog.jl")
include("relationaltypes.jl")
include("generate.jl")
end