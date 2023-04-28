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



function write_referredtable_location_plan!(plan::ReferredTableLocationPlan, node::ReferredTableItemRef, tableitem)    
    if haslocation(plan, node)
        return plan
    end
    plan.locations = referredtablelocations(plan.locations, node, tableitem)
    write_referredtable_location_plan!(plan, node.foreignkeys, tableitem)
end

write_referredtable_location_plan!(plan, ::Any, tableitem) = plan

function write_referredtable_location_plan!(plan, node::NodeList, tableitem)
    for each in node
        write_referredtable_location_plan!(plan, each, tableitem)
    end
    plan
end
write_referredtable_location_plan!(plan, node::SQLNode, tableitem) = error("please implement: write_referredtable_location_plan! for $(typeof(node))")

function write_referredtable_location_plan!(plan, node::SelectQuery)
    write_referredtable_location_plan!(plan, node.from, nothing)
    let tableitem = last(node.from)
        write_referredtable_location_plan!(plan, node.result, tableitem)
        write_referredtable_location_plan!(plan, node.filter, tableitem)            
        write_referredtable_location_plan!(plan, node.group, tableitem)
        write_referredtable_location_plan!(plan, node.groupfilter, tableitem)
        write_referredtable_location_plan!(plan, node.order, tableitem)
    end
end

function write_referredtable_location_plan!(plan, node::JoinItem, tableitem)
    write_referredtable_location_plan!(plan, node.left, nothing)
    write_referredtable_location_plan!(plan, node.join, last(node.left))
    write_referredtable_location_plan!(plan, node.right, nothing)
end

write_referredtable_location_plan!(plan, node::Join, tableitem) = write_referredtable_location_plan!(plan, node.condition, tableitem)
write_referredtable_location_plan!(plan, ::TableItem, tableitem) = plan



write_referredtable_location_plan!(plan, node::Not, tableitem) = write_referredtable_location_plan!(plan, node.expr, tableitem)
function write_referredtable_location_plan!(plan, node::And, tableitem)
    for each in node.elems
        write_referredtable_location_plan!(plan, each, tableitem)
    end
    plan
end
function write_referredtable_location_plan!(plan, node::Or, tableitem)
    write_referredtable_location_plan!(plan, node.left, tableitem)
    write_referredtable_location_plan!(plan, node.right, tableitem)
end

function write_referredtable_location_plan!(plan, node::Concat, tableitem)
    for each in node.expressions
        write_referredtable_location_plan!(plan, each, tableitem)
    end
    plan
end

write_referredtable_location_plan!(plan, node::Cast, tableitem) = write_referredtable_location_plan!(plan, node.expr, tableitem)
write_referredtable_location_plan!(plan, node::IsNull, tableitem) = write_referredtable_location_plan!(plan, node.expr, tableitem)
write_referredtable_location_plan!(plan, node::IsNotNull, tableitem) = write_referredtable_location_plan!(plan, node.expr, tableitem)
write_referredtable_location_plan!(plan, node::DescOrder, tableitem) = write_referredtable_location_plan!(plan, node.expr, tableitem)
write_referredtable_location_plan!(plan, node::Between, tableitem) = begin
    write_referredtable_location_plan!(plan, node.subject, tableitem)
    write_referredtable_location_plan!(plan, node.range, tableitem)
end
write_referredtable_location_plan!(plan, node::BetweenRange, tableitem) = begin
    write_referredtable_location_plan!(plan, node.left, tableitem)
    write_referredtable_location_plan!(plan, node.right, tableitem)
end
write_referredtable_location_plan!(plan, ::SQLConstant, tableitem) = plan
write_referredtable_location_plan!(plan, ::Exists, ::FromItem) = plan
write_referredtable_location_plan!(plan, ::NotExists, ::FromItem) = plan
function write_referredtable_location_plan!(plan, node::FunctionCall, tableitem)
    for each in node.operands
        write_referredtable_location_plan!(plan, each, tableitem)
    end
    plan
end

write_referredtable_location_plan!(plan, ::KeyedTableItemRef, ::FromItem) = plan

write_referredtable_location_plan!(plan, node::TableItemFieldRef, tableitem::FromItem) = write_referredtable_location_plan!(plan, node.table, tableitem)
write_referredtable_location_plan!(plan, ::SelectWithoutFromQuery, ::FromItem) = plan
write_referredtable_location_plan!(plan, node::SubqueryExpression, ::FromItem) = plan

function write_referredtable_location_plan!(plan, node::InExpression, tableitem)
    write_referredtable_location_plan!(plan, node.element, tableitem)
    write_referredtable_location_plan!(plan, node.set, tableitem)
end

write_referredtable_location_plan!(plan, node::SelectQuery, tableitem) = nothing

function write_referredtable_location_plan!(plan, node::AggregateExpression, tableitem)
    write_referredtable_location_plan!(plan, node.operands, tableitem)
    write_referredtable_location_plan!(plan, node.filter, tableitem)
    write_referredtable_location_plan!(plan, node.order, tableitem)
    plan
end

function write_referredtable_location_plan!(plan, node::OrderedSetAggregateExpression, tableitem)
    write_referredtable_location_plan!(plan, node.operands, tableitem)
    write_referredtable_location_plan!(plan, node.filter, tableitem)
    write_referredtable_location_plan!(plan, node.order, tableitem)
    plan
end

function write_referredtable_location_plan!(plan, node::WindowFunctionCall, tableitem)
    write_referredtable_location_plan!(plan, node.operands, tableitem)
    write_referredtable_location_plan!(plan, node.filter, tableitem)
    write_referredtable_location_plan!(plan, node.window, tableitem)
    plan
end

function write_referredtable_location_plan!(plan, node::WindowDefinition, tableitem)
    write_referredtable_location_plan!(plan, node.order, tableitem)
    write_referredtable_location_plan!(plan, node.partition, tableitem)
    plan
end

function write_referredtable_location_plan!(plan, t::Tuple, tableitem)
    for each in t
        write_referredtable_location_plan!(plan, each, tableitem)
    end
    plan
end