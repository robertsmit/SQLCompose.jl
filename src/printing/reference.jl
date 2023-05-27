mutable struct ReferredTableLocationPlan
    locations::Union{ImmutableDict,Nothing}
    env::Any
end

ReferredTableLocationPlan(env) = ReferredTableLocationPlan(nothing, env)

push_reference!(plan::ReferredTableLocationPlan, ref::ReferredTableItemRef, tableitem) =
    let entry = ref => key(tableitem)
        plan.locations = isnothing(plan.locations) ?
                         ImmutableDict(entry) :
                         ImmutableDict(plan.locations, entry)
        plan
    end

islocated(plan::ReferredTableLocationPlan, ref::ReferredTableItemRef) =
    (!isnothing(plan.locations) && haskey(plan.locations, ref)) || hasreferred(plan.env, ref)

mutable struct ReferredTableLocationPlan2
    visited
    tableitem
    env::Any
end

ReferredTableLocationPlan2(env) = ReferredTableLocationPlan2([], nothing, env)

function push_reference!(plan::ReferredTableLocationPlan2, ref::ReferredTableItemRef)
    if ref in plan.visited
        return false
    end
    condition = reduce(zip(ref.foreignkeys, ref.primarykeys), init=true) do acc, (foreign, prim)
        acc & (foreign == TableItemFieldRef(prim, UnknownType, ref))
    end
    plan.tableitem = JoinItem(plan.tableitem, DefinedTableItem(ref, ref.tablename), EquiJoin(ref.isnullable ? LeftJoin() : InnerJoin(), condition))
    plan.visited = [plan.visited..., ref]
    return true
end

function push_tableitem!(plan::ReferredTableLocationPlan2, tableitem)
    plan.tableitem = tableitem
end

function push_join!(plan::ReferredTableLocationPlan2, tableitem, join)
    plan.tableitem = JoinItem(plan.tableitem, tableitem, join)
end

islocated(plan::ReferredTableLocationPlan2, ref::ReferredTableItemRef) = ref in plan.visited


function write_referredtable_location_plan!(plan, node::SelectQuery)
    write_referredtable_location_plan!(plan, node.from)
    let tableitem = last(node.from)
        write_referredtable_location_plan!(plan, node.result, tableitem)
        write_referredtable_location_plan!(plan, node.filter, tableitem)
        write_referredtable_location_plan!(plan, node.group, tableitem)
        write_referredtable_location_plan!(plan, node.groupfilter, tableitem)
        write_referredtable_location_plan!(plan, node.order, tableitem)
    end
end

write_referredtable_location_plan!(plan, node::TableItem) = push_tableitem!(plan, node)

function write_referredtable_location_plan!(plan, node::JoinItem)
    write_referredtable_location_plan!(plan, node.left)
    write_referredtable_location_plan!(plan, node.join, last(node.left))
    push_join!(plan, node.right, node.join)
end



write_referredtable_location_plan!(plan, ::Any, tableitem) = nothing

write_referredtable_location_plan!(plan, node::Query, tableitem) = nothing

write_referredtable_location_plan!(plan, node::SelectWithoutFromQuery, tableitem) =
    write_referredtable_location_plan!(plan, node.result, tableitem)


function write_referredtable_location_plan!(plan, node::ReferredTableItemRef, tableitem)
    if push_reference!(plan, node)
        write_referredtable_location_plan!(plan, node.foreignkeys, tableitem)
    end
end

function write_referredtable_location_plan!(plan, node::Union{NodeList,AbstractVector,SQLNode}, tableitem)
    for each in node
        write_referredtable_location_plan!(plan, each, tableitem)
    end
end


write_referredtable_location_plan!(plan, node::Join, tableitem) = write_referredtable_location_plan!(plan, node.condition, tableitem)

write_referredtable_location_plan!(plan, node::TableItemFieldRef, tableitem::FromItem) = write_referredtable_location_plan!(plan, node.table, tableitem)

