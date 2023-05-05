
import Base: first, iterate, length, last

abstract type Join <: SQLNode end

struct JoinItem <: FromItem
    left::FromItem
    right::TableItem
    join::Join
end

abstract type JoinType end
struct InnerJoin <: JoinType end
struct LeftJoin <: JoinType end
struct RightJoin <: JoinType end
struct FullJoin <: JoinType end

struct EquiJoin <: Join
    type::JoinType
    condition::BooleanExpression
end

struct LateralJoin <: Join
    type::JoinType
    condition::BooleanExpression
end

struct UnmergedResult
    results::Tuple
end

first(f::TableItem) = f
first(f::JoinItem) = first(f.left)
last(f::TableItem) = f
last(f::JoinItem) = f.right