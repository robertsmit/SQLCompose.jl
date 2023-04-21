import UUIDs: UUID


abstract type SQLType <: SQLNode end



include("misc.jl");
include("structured.jl");
include("character.jl");
include("numeric.jl");
include("range.jl");
include("temporal.jl")
include("sqltypeclassof.jl");
include("printing.jl");

export UUIDType, TextType, EnumType, BooleanType




