module SQLCompose
using LibPQ, Tables, StaticArrays
import UUIDs: UUID
import Base: ImmutableDict

export →
export TableSource, reference
# composition
export query, groupby, join, with, join_lateral, having, left_join_lateral
export InnerJoin, LeftJoin, RightJoin, FullJoin
# operators
export between, avg, unnest
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
