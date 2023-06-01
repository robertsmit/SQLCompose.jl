
import Base: first, iterate, length, last, getindex

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



join_condition(::FromItem) = SQLConstant(true)
function join_condition(item::JoinItem)  
    join_condition(item.left) & join_condition(item, item.join, item.join.type)
end
join_condition(item::JoinItem, join::EquiJoin, type::InnerJoin) = join.condition
join_condition(item::JoinItem, join::Join, type::JoinType) = error("join condition is only valid for equi inner joins")


join_items(item::FromItem) = ()
join_items(item::JoinItem) = (join_items(item.left)..., item.right) 


first(f::TableItem) = f
first(f::JoinItem) = first(f.left)
last(f::TableItem) = f
last(f::JoinItem) = f.right
length(f::FromItem) = 1
length(f::JoinItem) = length(f.left) + 1


