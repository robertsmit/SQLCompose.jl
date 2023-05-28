abstract type AbstractPrintEnvironment end

struct NullPrintEnvironment <: AbstractPrintEnvironment end

struct TablePrintEnvironment <: AbstractPrintEnvironment
    key
    alias::Symbol
    parent::AbstractPrintEnvironment
end

struct ReferredTableEnvironment <: AbstractPrintEnvironment
    key::ReferredTableItemRef
    location::Symbol
    alias::Symbol
    parent::AbstractPrintEnvironment
end

PrintEnvironment() = NullPrintEnvironment()

unwind(env, table::TableItem) =  unwind(env, key(table))
unwind(env::TablePrintEnvironment, key::Symbol) = env.key == key ? env : unwind(env.parent, key)
unwind(env::TablePrintEnvironment, key::ReferredTableItemRef) = env.key == key ? env : unwind(env.parent, key)
unwind(env::ReferredTableEnvironment, key::Union{Symbol, TableItemRef}) = unwind(env.parent, key)
unwind(::NullPrintEnvironment, ::Union{Symbol, TableItemRef}) = error("should not occur")

hasreferred(env::NullPrintEnvironment, ref) = false
hasreferred(env::TablePrintEnvironment, ref) = env.key == key(ref) ? true : hasreferred(env.parent, ref)

tablealias(::NullPrintEnvironment, ref) = error("Unknown ref")
tablealias(env::AbstractPrintEnvironment, table::TableItem) = tablealias(env, table.ref)
tablealias(env::AbstractPrintEnvironment, ref::KeyedTableItemRef) = tablealias(env, ref.key)
tablealias(env::AbstractPrintEnvironment, ref) = env.key == ref ? env.alias : tablealias(env.parent, ref)

hasalias(::NullPrintEnvironment, alias) = false
hasalias(env::AbstractPrintEnvironment, alias) = env.alias == alias ? true : hasalias(env.parent, alias)

getaliasactual(::NullPrintEnvironment, aliashint) = aliashint
function getaliasactual(env::AbstractPrintEnvironment, aliashint, aliascandidate = aliashint, count = 1)
    if !hasalias(env, aliascandidate)
        return aliascandidate
    end
    aliascandidate = Symbol("$aliashint$(count + 1)")
    getaliasactual(env, aliashint, aliascandidate, count + 1)
end

function nextenv2(env, node::SelectQuery)
    plan = ReferredTableLocationPlan2(env)
    write_referredtable_location_plan!(plan, node.from)
    write_referredtable_location_plan!(plan, node.result)
    write_referredtable_location_plan!(plan, node.filter)
    write_referredtable_location_plan!(plan, node.group)
    write_referredtable_location_plan!(plan, node.groupfilter)
    write_referredtable_location_plan!(plan, node.order)
    nextnode = with_from(node, plan.tableitem)
    env = plan.env
    env, nextnode
end

function nextenv(env, table::TableItem)
    aliasactual = getaliasactual(env, aliashint(table))
    nextenv = TablePrintEnvironment(key(table), aliasactual, env)
end

function nextenv(env, table::RefTableItem)
    definition_env = unwind(env, table)
    (;key, alias) = definition_env
    TablePrintEnvironment(key, alias, env)
end

function nextenv(env, tableitem::JoinItem) 
    envleft = nextenv(env, tableitem.left)
    envright = nextenv(envleft, tableitem.right)
    envright
end