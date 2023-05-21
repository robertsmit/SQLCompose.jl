ReferredTableLocationDict = ImmutableDict{ReferredTableItemRef,Symbol}
ReferredTableLocations = Union{ReferredTableLocationDict,Nothing}
mutable struct ReferredTableLocationPlan
    locations::ReferredTableLocations
    env
end

ReferredTableLocationPlan(env) = ReferredTableLocationPlan(nothing, env)

referredtablelocations(::Nothing, ref::ReferredTableItemRef, tableitem) = ImmutableDict(ref => key(tableitem))
referredtablelocations(d::ReferredTableLocationDict, ref::ReferredTableItemRef, tableitem) = ImmutableDict(d, ref => key(tableitem))

haslocation(::Nothing, ref::ReferredTableItemRef) = false
haslocation(d::ReferredTableLocationDict, ref::ReferredTableItemRef) = haskey(d, ref)
haslocation(plan::ReferredTableLocationPlan, ref::ReferredTableItemRef) =  haslocation(plan.locations, ref) || hasreferred(plan.env, ref)


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
    if haslocation(plan, node)
        return
    end
    plan.locations = referredtablelocations(plan.locations, node, tableitem)
    write_referredtable_location_plan!(plan, node.foreignkeys, tableitem)
end

function write_referredtable_location_plan!(plan, node::Union{NodeList, AbstractVector, SQLNode}, tableitem)
    for each in node
        write_referredtable_location_plan!(plan, each, tableitem)
    end
end


write_referredtable_location_plan!(plan, node::Join, tableitem) = write_referredtable_location_plan!(plan, node.condition, tableitem)

write_referredtable_location_plan!(plan, node::TableItemFieldRef, tableitem::FromItem) = write_referredtable_location_plan!(plan, node.table, tableitem)

