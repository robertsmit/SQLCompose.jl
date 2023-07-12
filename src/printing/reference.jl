mutable struct ReferredTableExpander
    tableitem::Union{FromItem, Nothing}
    filter::BooleanExpression
    env::Any
end

ReferredTableExpander(env) = ReferredTableExpander(nothing, true, env)
ReferredTableExpander() = ReferredTableExpander(NullPrintEnvironment())

expanded(node::SQLNode, expander::ReferredTableExpander) = @chain node begin
    with_from(_, expander.tableitem)
    with_filter(_, node.filter & expander.filter)
end

function push_referred!(plan::ReferredTableExpander, ref::ReferredTableItemRef)
    condition = reduce(zip(ref.foreignkeys, ref.primarykeys), init=true) do acc, (foreign, prim)
        acc & (foreign == TableItemFieldRef(prim, UnknownType, ref))
    end
    referred_tableitem = DefinedTableItem(ref)
    push_join!(plan, referred_tableitem, EquiJoin(ref.isnullable ? LeftJoin() : InnerJoin(), condition))
end

function push_tableitem!(plan::ReferredTableExpander, tableitem)
    plan.tableitem = tableitem
    plan.env = nextenv(plan.env, tableitem)
end

function push_join!(plan::ReferredTableExpander, tableitem, join)
    plan.env = nextenv(plan.env, tableitem)
    push_join!(plan, plan.tableitem, tableitem, join)
end

function push_join!(plan::ReferredTableExpander, ::Nothing, right, join)
    @assert typeof(join) == EquiJoin && join.type == InnerJoin() "Only equi inner joins can be joined to nothing"
    plan.filter = plan.filter & join.condition
    plan.tableitem = right
end

function push_join!(plan::ReferredTableExpander, left, right, join)
    plan.tableitem = JoinItem(left, right, join)
end

write!(plan::ReferredTableExpander, node::TableItem) = push_tableitem!(plan, node)

function write!(plan::ReferredTableExpander, node::JoinItem)
    write!(plan, node.left)
    write!(plan, node.join)
    push_join!(plan, node.right, node.join)
end



write!(::ReferredTableExpander, ::Any) = nothing

write!(::ReferredTableExpander, node::SelectQuery) = nothing

function write!(plan::ReferredTableExpander, node::ReferredTableItemRef)
    if hasref(plan.env, node)
        return
    end
    write!(plan, node.foreignkeys)
    push_referred!(plan, node)
end

function write!(plan::ReferredTableExpander, node::Union{NodeList,AbstractVector})
    for each in node
        write!(plan, each)
    end
end

function write!(plan::ReferredTableExpander, node::T) where {T<:RowStruct}
    for each in node
        write!(plan, each)
    end
end

@generated function write!(plan::ReferredTableExpander, node::T) where {T<:SQLNode}
    statements = (:(write!(plan, node.$field)) for field in fieldnames(T))
    quote
        $(statements...)
    end
end

function expand(expander::ReferredTableExpander, query::SelectQuery)
    write!(expander, query.from)
    write!(expander, query.result)
    write!(expander, query.filter)
    write!(expander, query.group)
    write!(expander, query.groupfilter)
    write!(expander, query.order)
    expanded(query, expander)
end

function expand(expander::ReferredTableExpander, stmnt::UpdateStatement)
    write!(expander, stmnt.from)
    write!(expander, stmnt.changes)
    write!(expander, stmnt.returning)
    write!(expander, stmnt.filter)
    expanded(stmnt, expander)
end
