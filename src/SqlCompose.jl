module SQLCompose
using LibPQ, Tables, StaticArrays
import Base: ImmutableDict

export TableDefinition, lateral
# composition
export query, groupby, join, with
# operators
export between
#globals
export All


include("./util.jl")
include("./nodes/base.jl")
include("./queryset/base.jl")
include("./compose/base.jl")
include("./generate/base.jl")
include("./printing/base.jl")

end
