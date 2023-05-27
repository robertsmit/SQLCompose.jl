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

unwind(env, table::TableItem) = begin 

    unwind(env, key(table))

end
unwind(env::TablePrintEnvironment, key::Symbol) = env.key == key ? env : unwind(env.parent, key)
unwind(env::TablePrintEnvironment, key::ReferredTableItemRef) = env.key == key ? env : unwind(env.parent, key)
unwind(env::ReferredTableEnvironment, key::Union{Symbol, TableItemRef}) = unwind(env.parent, key)
unwind(::NullPrintEnvironment, ::Union{Symbol, TableItemRef}) = error("should not occur")

unwind_referred(::NullPrintEnvironment, table::TableItem) = error("should not occur")
unwind_referred(::NullPrintEnvironment, table::Union{Symbol, TableItemRef}) = error("should not occur")
unwind_referred(env, table::TableItem) = unwind_referred(env, key(table))
unwind_referred(env::TablePrintEnvironment, table::Union{Symbol, TableItemRef}) = env.key === table ? NullPrintEnvironment() : unwind_referred(env.parent, table)
unwind_referred(env::ReferredTableEnvironment, table::Union{Symbol,TableItemRef}) = env.location == table ? env : unwind_referred(env.parent, table)
next_referred(env::ReferredTableEnvironment) = unwind_referred(env.parent, env.location)

hasreferred(env::NullPrintEnvironment, ref::ReferredTableItemRef) = false
hasreferred(env::ReferredTableEnvironment, ref::ReferredTableItemRef) = env.key == ref ? true : hasreferred(env.parent, ref)
hasreferred(env::TablePrintEnvironment, ref::ReferredTableItemRef) = hasreferred(env.parent, ref)

tablealias(::NullPrintEnvironment, ref) = :kaas
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

function nextenv(env, node::SelectQuery)
    plan = ReferredTableLocationPlan(env)
    write_referredtable_location_plan!(plan, node)
    env = nextenv(env, node.from; referredtablelocations=plan.locations)
    env
end

function nextenv2(env, node::SelectQuery)
    plan = ReferredTableLocationPlan2(env)
    write_referredtable_location_plan!(plan, node)
    nextnode = with_from(node, plan.tableitem)
    env = nextenv(env, nextnode.from; referredtablelocations=nothing)
    env, nextnode
end

function nextenv(env, table::TableItem; referredtablelocations = nothing)
    aliasactual = getaliasactual(env, aliashint(table))
    nextenv = TablePrintEnvironment(key(table), aliasactual, env)
    nextenv_referred(nextenv, table, referredtablelocations)
end

function nextenv(env, table::RefTableItem; referredtablelocations=nothing)
    definition_env = unwind(env, table)
    (;key, alias) = definition_env
    next_env = TablePrintEnvironment(key, alias, env)
    nextenv_referred(next_env, table, referredtablelocations)
end

function nextenv(env, tableitem::JoinItem; referredtablelocations) 
    envleft = nextenv(env, tableitem.left; referredtablelocations)
    envright = nextenv(envleft, tableitem.right; referredtablelocations)
    envright
end

nextenv_referred(env, ::TableItem, ::Nothing) = env
nextenv_referred(env, table::TableItem, locs) = nextenv_referred(env, key(table), locs)
function nextenv_referred(env, table::Symbol, locs)
    let next_env = env
        for (lat, location) in locs
            next_env = location == table ? nextenv(next_env, lat, location) : next_env
        end
        next_env
    end
end

function nextenv(env, reference::ReferredTableItemRef, location::Symbol)
    aliasactual = getaliasactual(env, aliashint(reference))
    ReferredTableEnvironment(reference, location, aliasactual, env)
end