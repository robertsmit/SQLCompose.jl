


mutable struct ReferredTableLocationPlan2
    tableitem
    env::Any
end

ReferredTableLocationPlan2(env) = ReferredTableLocationPlan2(nothing, env)

function push_reference!(plan::ReferredTableLocationPlan2, ref::ReferredTableItemRef)
    condition = reduce(zip(ref.foreignkeys, ref.primarykeys), init=true) do acc, (foreign, prim)
        acc & (foreign == TableItemFieldRef(prim, UnknownType, ref))
    end
    plan.tableitem = JoinItem(plan.tableitem, DefinedTableItem(ref, ref.tablename), EquiJoin(ref.isnullable ? LeftJoin() : InnerJoin(), condition))
    plan.env = nextenv(plan.env, ref)
end

function push_tableitem!(plan::ReferredTableLocationPlan2, tableitem)
    plan.tableitem = tableitem
    plan.env = nextenv(plan.env, tableitem)
end

function push_join!(plan::ReferredTableLocationPlan2, tableitem, join)
    plan.tableitem = JoinItem(plan.tableitem, tableitem, join)
    plan.env = nextenv(plan.env, tableitem)
end

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
    if hasreferred(plan.env, node)
        return
    end
    write_referredtable_location_plan!(plan, node.foreignkeys, tableitem)
    push_reference!(plan, node)
end

function write_referredtable_location_plan!(plan, node::Union{NodeList,AbstractVector,SQLNode}, tableitem)
    for each in node
        write_referredtable_location_plan!(plan, each, tableitem)
    end
end

