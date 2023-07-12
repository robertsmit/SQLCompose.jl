abstract type ReferredTableExpander end

struct RefJoin
    tableitem
    join::EquiJoin
end

mutable struct SelectQueryReferredTableExpander <: ReferredTableExpander
    tableitem
    env::Any
    joins::Vector{RefJoin}
end

SelectQueryReferredTableExpander(env) = SelectQueryReferredTableExpander(nothing, env, [])
SelectQueryReferredTableExpander() = SelectQueryReferredTableExpander(NullPrintEnvironment())

function expand(expander::SelectQueryReferredTableExpander, query::SelectQuery)
    write!(expander, query.from)
    write!(expander, query.result)
    write!(expander, query.filter)
    write!(expander, query.group)
    write!(expander, query.groupfilter)
    write!(expander, query.order)
    with_from(query, expander.tableitem)
end

function expand(expander::SelectQueryReferredTableExpander, stmnt::UpdateStatement)
    write!(expander, stmnt.from)
    write!(expander, stmnt.changes)
    write!(expander, stmnt.returning)
    write!(expander, stmnt.filter)
    with_from(query, expander.tableitem)
end


function push_referred!(plan::SelectQueryReferredTableExpander, ref::ReferredTableItemRef)
    condition = reduce(zip(ref.foreignkeys, ref.primarykeys), init=true) do acc, (foreign, prim)
        acc & (foreign == TableItemFieldRef(prim, UnknownType, ref))
    end
    referred_tableitem = DefinedTableItem(ref)
    plan.tableitem = JoinItem(plan.tableitem, referred_tableitem, EquiJoin(ref.isnullable ? LeftJoin() : InnerJoin(), condition))
    plan.env = nextenv(plan.env, referred_tableitem)
end

function push_tableitem!(plan::SelectQueryReferredTableExpander, tableitem)
    plan.tableitem = tableitem
    plan.env = nextenv(plan.env, tableitem)
end

function push_join!(plan::SelectQueryReferredTableExpander, tableitem, join)
    plan.tableitem = JoinItem(plan.tableitem, tableitem, join)
    plan.env = nextenv(plan.env, tableitem)
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

