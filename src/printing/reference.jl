abstract type ReferredTableLocationPlan2 end


mutable struct SelectQueryTableItemBuilder <: ReferredTableLocationPlan2
    tableitem
    env::Any
end

function build(builder::SelectQueryTableItemBuilder, query::SelectQuery)
    write!(builder, query.from)
    write!(builder, query.result)
    write!(builder, query.filter)
    write!(builder, query.group)
    write!(builder, query.groupfilter)
    write!(builder, query.order)
    with_from(query, builder.tableitem)
end

SelectQueryTableItemBuilder(env) = SelectQueryTableItemBuilder(nothing, env)

function push_reference!(plan::SelectQueryTableItemBuilder, ref::ReferredTableItemRef)
    condition = reduce(zip(ref.foreignkeys, ref.primarykeys), init=true) do acc, (foreign, prim)
        acc & (foreign == TableItemFieldRef(prim, UnknownType, ref))
    end
    referred_tableitem = DefinedTableItem(ref)
    plan.tableitem = JoinItem(plan.tableitem, referred_tableitem, EquiJoin(ref.isnullable ? LeftJoin() : InnerJoin(), condition))
    plan.env = nextenv(plan.env, referred_tableitem)
end

function push_tableitem!(plan::SelectQueryTableItemBuilder, tableitem)
    plan.tableitem = tableitem
    plan.env = nextenv(plan.env, tableitem)
end

function push_join!(plan::SelectQueryTableItemBuilder, tableitem, join)
    plan.tableitem = JoinItem(plan.tableitem, tableitem, join)
    plan.env = nextenv(plan.env, tableitem)
end

write!(plan::ReferredTableLocationPlan2, node::TableItem) = push_tableitem!(plan, node)

function write!(plan::ReferredTableLocationPlan2, node::JoinItem)
    write!(plan, node.left)
    write!(plan, node.join)
    push_join!(plan, node.right, node.join)
end



write!(::ReferredTableLocationPlan2, ::Any) = nothing

write!(::ReferredTableLocationPlan2, node::SelectQuery) = nothing

function write!(plan::ReferredTableLocationPlan2, node::ReferredTableItemRef)
    if hasref(plan.env, node)
        return
    end
    write!(plan, node.foreignkeys)
    push_reference!(plan, node)
end

function write!(plan::ReferredTableLocationPlan2, node::Union{NodeList,AbstractVector,SQLNode})
    for each in node
        write!(plan, each)
    end
end

function write!(plan::ReferredTableLocationPlan2, node::T) where {T<:RowStruct}
    for each in node
        write!(plan, each)
    end
end

