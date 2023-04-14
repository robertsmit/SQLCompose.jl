LateralLocationsDict = ImmutableDict{LateralTableItemRef,Symbol}
LateralLocations = Union{LateralLocationsDict,Nothing}

haslocation(::Nothing, lat::LateralTableItemRef) = false
haslocation(d::LateralLocationsDict, lat::LateralTableItemRef) = haskey(d, lat)

laterallocations(::Nothing, ref::LateralTableItemRef, tableitem) = ImmutableDict(ref => key(tableitem))
laterallocations(d::LateralLocationsDict, ref::LateralTableItemRef, tableitem) = ImmutableDict(d, ref => key(tableitem))

mutable struct LateralPlan
    locations::LateralLocations
    env
end

LateralPlan(env) = LateralPlan(nothing, env)

function writelateralplan!(plan::LateralPlan, node::LateralTableItemRef, tableitem)
    if haslocation(plan.locations, node) || haslateral(plan.env, node)
        return plan
    end
    plan.locations = laterallocations(plan.locations, node, tableitem)
    writelateralplan!(plan, node.foreignkeys, tableitem)
end

writelateralplan!(plan, ::Any, tableitem) = plan

function writelateralplan!(plan, node::NodeList, tableitem)
    for each in node
        writelateralplan!(plan, each, tableitem)
    end
    plan
end
writelateralplan!(plan, node::SQLNode, tableitem) = error("please implement: writelateralplan! for $(typeof(node))")

function writelateralplan!(plan, node::SelectQuery)
    writelateralplan!(plan, node.from, nothing)
    let tableitem = last(node.from)
        writelateralplan!(plan, node.result, tableitem)
        writelateralplan!(plan, node.filter, tableitem)
        writelateralplan!(plan, node.clauses, tableitem)
        writelateralplan!(plan, node.order, tableitem)
    end
end

function writelateralplan!(plan, node::MoreClauses, tableitem)
    writelateralplan!(plan, node.group, tableitem)
    writelateralplan!(plan, node.groupfilter, tableitem)
end

function writelateralplan!(plan, node::JoinItem, tableitem)
    writelateralplan!(plan, node.left, nothing)
    writelateralplan!(plan, node.join, last(node.left))
    writelateralplan!(plan, node.right, nothing)
end

writelateralplan!(plan, node::EquiJoin, tableitem) = writelateralplan!(plan, node.condition, tableitem)
writelateralplan!(plan, ::TableItem, tableitem) = plan

writelateralplan!(plan, node::Not, tableitem) = writelateralplan!(plan, node.expr, tableitem)
function writelateralplan!(plan, node::And, tableitem)
    for each in node.elems
        writelateralplan!(plan, each, tableitem)
    end
    plan
end
function writelateralplan!(plan, node::Or, tableitem)
    writelateralplan!(plan, node.left, tableitem)
    writelateralplan!(plan, node.right, tableitem)
end

function writelateralplan!(plan, node::Concat, tableitem)
    for each in node.expressions
        writelateralplan!(plan, each, tableitem)
    end
    plan
end

writelateralplan!(plan, node::Cast, tableitem) = writelateralplan!(plan, node.expr, tableitem)
writelateralplan!(plan, node::IsNull, tableitem) = writelateralplan!(plan, node.expr, tableitem)
writelateralplan!(plan, node::IsNotNull, tableitem) = writelateralplan!(plan, node.expr, tableitem)
writelateralplan!(plan, node::DescOrder, tableitem) = writelateralplan!(plan, node.expr, tableitem)
writelateralplan!(plan, node::Between, tableitem) = begin
    writelateralplan!(plan, node.subject, tableitem)
    writelateralplan!(plan, node.range, tableitem)
end
writelateralplan!(plan, node::BetweenRange, tableitem) = begin
    writelateralplan!(plan, node.left, tableitem)
    writelateralplan!(plan, node.right, tableitem)
end
writelateralplan!(plan, ::SQLConstant, tableitem) = plan
writelateralplan!(plan, ::Exists, ::FromItem) = plan
writelateralplan!(plan, ::NotExists, ::FromItem) = plan
function writelateralplan!(plan, node::FunctionCall, tableitem)
    for each in node.operands
        writelateralplan!(plan, each, tableitem)
    end
    plan
end

writelateralplan!(plan, ::KeyedTableItemRef, ::FromItem) = plan

writelateralplan!(plan, node::TableItemFieldRef, tableitem::FromItem) = writelateralplan!(plan, node.table, tableitem)
writelateralplan!(plan, ::SelectWithoutFromQuery, ::FromItem) = plan
writelateralplan!(plan, node::SubqueryExpression, ::FromItem) = plan

function writelateralplan!(plan, node::InExpression, tableitem)
    writelateralplan!(plan, node.element, tableitem)
    writelateralplan!(plan, node.set, tableitem)
end

writelateralplan!(plan, node::SelectQuery, tableitem) = nothing

function writelateralplan!(plan, node::AggregateExpression, tableitem)
    writelateralplan!(plan, node.operands, tableitem)
    writelateralplan!(plan, node.filter, tableitem)
    writelateralplan!(plan, node.order, tableitem)
    plan
end

function writelateralplan!(plan, node::OrderedSetAggregateExpression, tableitem)
    writelateralplan!(plan, node.operands, tableitem)
    writelateralplan!(plan, node.filter, tableitem)
    writelateralplan!(plan, node.order, tableitem)
    plan
end

function writelateralplan!(plan, node::WindowFunctionCall, tableitem)
    writelateralplan!(plan, node.operands, tableitem)
    writelateralplan!(plan, node.filter, tableitem)
    writelateralplan!(plan, node.window, tableitem)
    plan
end

function writelateralplan!(plan, node::WindowDefinition, tableitem)
    writelateralplan!(plan, node.order, tableitem)
    writelateralplan!(plan, node.partition, tableitem)
    plan
end

function writelateralplan!(plan, t::Tuple, tableitem)
    for each in t
        writelateralplan!(plan, each, tableitem)
    end
    plan
end