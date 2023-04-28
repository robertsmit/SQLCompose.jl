abstract type AbstractPrintEnvironment end

struct NullPrintEnvironment <: AbstractPrintEnvironment end

struct TableItemPrintEnvironment <: AbstractPrintEnvironment
    key::Symbol
    alias::Symbol
    parent::AbstractPrintEnvironment
end

TableItemPrintEnvironment(env::TableItemPrintEnvironment, parent) = TableItemPrintEnvironment(env.key, env.alias, parent)

struct LateralPrintEnvironment <: AbstractPrintEnvironment
    key::LateralTableItemRef
    location::Symbol
    alias::Symbol
    parent::AbstractPrintEnvironment
end

PrintEnvironment() = NullPrintEnvironment()


unwind(::NullPrintEnvironment, table::TableItem) = error("should not occur")
unwind(env, table::TableItem) = unwind(env, key(table))
unwind(env::TableItemPrintEnvironment, key::Symbol) = env.key == key ? env : unwind(env.parent, key)
unwind(env::LateralPrintEnvironment, key::Symbol) = unwind(env.parent, key)

unwind_lateral(::NullPrintEnvironment, table::TableItem) = error("should not occur")
unwind_lateral(::NullPrintEnvironment, table::Symbol) = error("should not occur")
unwind_lateral(env, table::TableItem) = unwind_lateral(env, key(table))
unwind_lateral(env::TableItemPrintEnvironment, table::Symbol) = env.key === table ? NullPrintEnvironment() : unwind_lateral(env.parent, table)
unwind_lateral(env::LateralPrintEnvironment, table::Symbol) = env.location == table ? env : unwind_lateral(env.parent, table)
next_unwind_lateral(env::LateralPrintEnvironment) = unwind_lateral(env.parent, env.location)

haslateral(env::NullPrintEnvironment, reference::LateralTableItemRef) = false
haslateral(env::LateralPrintEnvironment, reference::LateralTableItemRef) = env.key == reference ? true : haslateral(env.parent, reference)
haslateral(env::TableItemPrintEnvironment, reference::LateralTableItemRef) = haslateral(env.parent, reference)

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



function nextenv(env, table::RefTableItem; laterallocations=nothing)
    definition_env = unwind(env, table)
    next_env = TableItemPrintEnvironment(definition_env, env)
    nextenv_laterals(next_env, table, laterallocations)
end

function nextenv(env, table::TableItem; laterallocations = nothing)
    (; key, aliashint) = table.ref
    aliasactual = getaliasactual(env, aliashint)
    nextenv = TableItemPrintEnvironment(key, aliasactual, env)
    nextenv_laterals(nextenv, table, laterallocations)
end

function nextenv(env, tableitem::JoinItem; laterallocations) 
    envleft = nextenv(env, tableitem.left; laterallocations)
    envright = nextenv(envleft, tableitem.right; laterallocations)
    envright
end

function nextenv(env, node::SelectQuery)
    plan = LateralPlan(env)
    writelateralplan!(plan, node)
    env = nextenv(env, node.from; laterallocations=plan.locations)
    env
end

nextenv_laterals(env, ::TableItem, ::Nothing) = env
nextenv_laterals(env, table::TableItem, locs::LateralLocationsDict) = nextenv_laterals(env, key(table), locs)
function nextenv_laterals(env, table::Symbol, locs::LateralLocationsDict)
    let next_env = env
        for (lat, location) in locs
            next_env = location == table ? nextenv(next_env, lat, location) : next_env
        end
        next_env
    end
end

function nextenv(env, reference::LateralTableItemRef, location::Symbol)
    aliasactual = getaliasactual(env, aliashint(reference))
    LateralPrintEnvironment(reference, location, aliasactual, env)
end