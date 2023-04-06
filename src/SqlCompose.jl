module SQLCompose

export TableDefinition, lateral
# composition
export query, groupby, sortby, join, with

using LibPQ
using StaticArrays
import Base: ImmutableDict

include("./nodes/base.jl")
include("./queryset/base.jl")
include("./compose/base.jl")
include("./generate/base.jl")
include("./printing/base.jl")

end
