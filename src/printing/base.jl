include("./reference.jl")
include("./environment.jl")
include("./printing.jl")

Base.show(io::IO, node::Union{SQLType, SQLCommand}) = printpsql(io, node)