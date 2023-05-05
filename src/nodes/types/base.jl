abstract type SQLType <: SQLNode end

include("misc.jl");
include("structured.jl");
include("character.jl");
include("numeric.jl");
include("range.jl");
include("temporal.jl")
include("printing.jl");