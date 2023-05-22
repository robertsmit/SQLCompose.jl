mutable struct ReferredTableLocationPlan
    locations::Union{ImmutableDict,Nothing}
    env::Any
end

pushlocation!(plan::ReferredTableLocationPlan, ref::ReferredTableItemRef, tableitem) =
    let entry = ref => key(tableitem)
        plan.locations = isnothing(plan.locations) ?
                         ImmutableDict(entry) :
                         ImmutableDict(plan.locations, entry)
        plan
    end

ReferredTableLocationPlan(env) = ReferredTableLocationPlan(nothing, env)

islocated(plan::ReferredTableLocationPlan, ref::ReferredTableItemRef) =
    (!isnothing(plan.locations) && haskey(plan.locations, ref)) || hasreferred(plan.env, ref)


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

write_referredtable_location_plan!(plan, node::FromItem) = nothing
function write_referredtable_location_plan!(plan, node::JoinItem)
    write_referredtable_location_plan!(plan, node.left)
    write_referredtable_location_plan!(plan, node.join, last(node.left))
    write_referredtable_location_plan!(plan, node.right)
end

write_referredtable_location_plan!(plan, ::Any, tableitem) = nothing
write_referredtable_location_plan!(plan, node::Query, tableitem) = nothing

function write_referredtable_location_plan!(plan, node::ReferredTableItemRef, tableitem)
    if islocated(plan, node)
        return
    end
    pushlocation!(plan, node, tableitem)
    write_referredtable_location_plan!(plan, node.foreignkeys, tableitem)
end

function write_referredtable_location_plan!(plan, node::Union{NodeList,AbstractVector,SQLNode}, tableitem)
    for each in node
        write_referredtable_location_plan!(plan, each, tableitem)
    end
end


write_referredtable_location_plan!(plan, node::Join, tableitem) = write_referredtable_location_plan!(plan, node.condition, tableitem)

write_referredtable_location_plan!(plan, node::TableItemFieldRef, tableitem::FromItem) = write_referredtable_location_plan!(plan, node.table, tableitem)

