abstract type AbstractPrintEnvironment end

struct NullPrintEnvironment <: AbstractPrintEnvironment end

struct TablePrintEnvironment <: AbstractPrintEnvironment
    ref
    alias::Symbol
    parent::AbstractPrintEnvironment
end

PrintEnvironment() = NullPrintEnvironment()

unwind(env, table::JoinItem) =  unwind(env, ref(table.right))
unwind(env, table::TableItem) =  unwind(env, ref(table))
unwind(::NullPrintEnvironment, ::TableItemRef) = error("should not occur")
unwind(env::TablePrintEnvironment, ref::TableItemRef) = env.ref == ref ? env : unwind(env.parent, ref)

hasref(env::NullPrintEnvironment, ref) = false
hasref(env::TablePrintEnvironment, ref) = env.ref == ref ? true : hasref(env.parent, ref)

getalias(env::AbstractPrintEnvironment, table::TableItem) = getalias(env, table.ref)
getalias(::NullPrintEnvironment, ref) = error("Unknown ref")
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

function nextenv(env, table::TableItem)
    aliasactual = getaliasactual(env, aliashint(table))
    nextenv = TablePrintEnvironment(ref(table), aliasactual, env)
end

function nextenv(env, table::JoinItem)
    nextenv(nextenv(env, table.left), table.right)
end

function nextenv(env, table::RefTableItem)
    definition_env = unwind(env, table)
    (;ref, alias) = definition_env
    TablePrintEnvironment(ref, alias, env)
end