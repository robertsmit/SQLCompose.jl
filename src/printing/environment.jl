abstract type AbstractPrintEnvironment end

struct NullPrintEnvironment <: AbstractPrintEnvironment end

struct TablePrintEnvironment <: AbstractPrintEnvironment
    key::Symbol
    alias::Symbol
    parent::AbstractPrintEnvironment
end

TablePrintEnvironment(env::TablePrintEnvironment, parent) = TablePrintEnvironment(env.key, env.alias, parent)

struct ReferredTableEnvironment <: AbstractPrintEnvironment
    key::ReferredTableItemRef
    location::Symbol
    alias::Symbol
    parent::AbstractPrintEnvironment
end

PrintEnvironment() = NullPrintEnvironment()

unwind(env, table::TableItem) = unwind(env, key(table))
unwind(env::TablePrintEnvironment, key::Symbol) = env.key == key ? env : unwind(env.parent, key)
unwind(env::ReferredTableEnvironment, key::Symbol) = unwind(env.parent, key)
unwind(::NullPrintEnvironment, ::Symbol) = error("should not occur")

unwind_referred(::NullPrintEnvironment, table::TableItem) = error("should not occur")
unwind_referred(::NullPrintEnvironment, table::Symbol) = error("should not occur")
unwind_referred(env, table::TableItem) = unwind_referred(env, key(table))
unwind_referred(env::TablePrintEnvironment, table::Symbol) = env.key === table ? NullPrintEnvironment() : unwind_referred(env.parent, table)
unwind_referred(env::ReferredTableEnvironment, table::Symbol) = env.location == table ? env : unwind_referred(env.parent, table)
next_referred(env::ReferredTableEnvironment) = unwind_referred(env.parent, env.location)

hasreferred(env::NullPrintEnvironment, ref::ReferredTableItemRef) = false
hasreferred(env::ReferredTableEnvironment, ref::ReferredTableItemRef) = env.key == ref ? true : hasreferred(env.parent, ref)
hasreferred(env::TablePrintEnvironment, ref::ReferredTableItemRef) = hasreferred(env.parent, ref)

tablealias(::NullPrintEnvironment, ref) = error("should not occur")
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



function nextenv(env, table::RefTableItem; referredtablelocations=nothing)
    definition_env = unwind(env, table)
    next_env = TablePrintEnvironment(definition_env, env)
    nextenv_laterals(next_env, table, referredtablelocations)
end

function nextenv(env, table::TableItem; referredtablelocations = nothing)
    (; key, aliashint) = table.ref
    aliasactual = getaliasactual(env, aliashint)
    nextenv = TablePrintEnvironment(key, aliasactual, env)
    nextenv_laterals(nextenv, table, referredtablelocations)
end

function nextenv(env, tableitem::JoinItem; referredtablelocations) 
    envleft = nextenv(env, tableitem.left; referredtablelocations)
    envright = nextenv(envleft, tableitem.right; referredtablelocations)
    envright
end

function nextenv(env, node::SelectQuery)
    plan = ReferredTableLocationPlan(env)
    write_referredtable_location_plan!(plan, node)
    env = nextenv(env, node.from; referredtablelocations=plan.locations)
    env
end

nextenv_laterals(env, ::TableItem, ::Nothing) = env
nextenv_laterals(env, table::TableItem, locs) = nextenv_laterals(env, key(table), locs)
function nextenv_laterals(env, table::Symbol, locs)
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