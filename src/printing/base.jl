include("./lateralplan.jl")
include("./environment.jl")
include("./printing.jl")

Base.show(io::IO, node::SQLNode) = printpsql(io, node)

psqlstring(node) = string(node)