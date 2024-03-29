module SQLCompose
using LibPQ, Tables, StaticArrays, Dates, Chain
import UUIDs: UUID
import Base: ImmutableDict, println
import Base: filter, map, sort, join, getindex, iterate, unique

export →
export TableSource, reference
# composition
export query, groupby, join, with, join_lateral, having, left_join_lateral, update, set
export InnerJoin, LeftJoin, RightJoin, FullJoin
export desc, asc
# operators
export between, avg, unnest, case, @eager, @query, @update
#comparing
export @like_str, @ilike_str, @similarto_str, like, similarto, matching
#globals
export All
#types
export Int8Type, Int4Type, Int2Type, Float8Type, Float4Type,
    UUIDType, TextType, EnumType, BooleanType, RowType, CharType, CharacterType


include("./util.jl")
include("./nodes/base.jl")
include("./queryset/base.jl")
include("./compose/base.jl")
include("./generate/base.jl")
include("./printing/base.jl")

end
