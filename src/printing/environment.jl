abstract type AbstractPrintEnvironment end

struct NullPrintEnvironment <: AbstractPrintEnvironment end

struct TablePrintEnvironment <: AbstractPrintEnvironment
    ref
    alias::Symbol
    parent::AbstractPrintEnvironment
end

PrintEnvironment() = NullPrintEnvironment()

unwind(env, table::TableItem) =  unwind(env, ref(table))
unwind(env::TablePrintEnvironment, ref::TableItemRef) = env.ref == ref ? env : unwind(env.parent, ref)
unwind(::NullPrintEnvironment, ::TableItemRef) = error("should not occur")

hasref(env::NullPrintEnvironment, ref) = false
hasref(env::TablePrintEnvironment, ref) = env.ref == ref ? true : hasref(env.parent, ref)

getalias(::NullPrintEnvironment, ref) = error("Unknown ref")
getalias(env::AbstractPrintEnvironment, table::TableItem) = getalias(env, table.ref)
getalias(env::AbstractPrintEnvironment, ref) = env.ref == ref ? env.alias : getalias(env.parent, ref)

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
    nextenv = TablePrintEnvironment(ref(table), aliasactual, env)
end

function nextenv(env, table::RefTableItem)
    definition_env = unwind(env, table)
    (;ref, alias) = definition_env
    TablePrintEnvironment(ref, alias, env)
end

function nextenv(env, tableitem::JoinItem) 
    envleft = nextenv(env, tableitem.left)
    envright = nextenv(envleft, tableitem.right)
    envright
end