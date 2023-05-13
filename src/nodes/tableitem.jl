aliashintdefault(name::Symbol, len=1) =
    let str = string(name)
        Symbol(str[1:min(len, length(str))])
    end

abstract type FromItem <: SQLNode end

abstract type TableItem <: FromItem end

abstract type TableItemRef <: SQLNode end

struct KeyedTableItemRef <: TableItemRef
    key::Symbol
    aliashint::Symbol
end

key(ref::KeyedTableItemRef) = ref.key
key(tableitem::TableItem) = key(tableitem.ref)

TableItemRef(aliashint) = KeyedTableItemRef(gensym(), aliashint)

struct TableItemFieldRef{T} <: SQLExpression{T}
    name::Symbol
    type::Type{T}
    table::TableItemRef
end

struct TableSource
    type
    aliashint::Symbol
end

TableSource(type) = TableSource(type, aliashintdefault(name(type)))

TableSource(name::Symbol, names_types::Pair...; aliashint=aliashintdefault(name)) =
    let nt = NamedTuple(names_types)
        TableSource(RowType{name,keys(nt),Tuple{values(nt)...}}, aliashint)
    end
name(table::TableSource) = name(table.type)
field_names(table::TableSource) = field_names(table.type)
field_pairs(table::TableSource) = field_pairs(table.type)


→(table::TableSource, alias::Symbol) = TableSource(table.type, alias)
→(type::Type{<:RowType}, alias::Symbol) = TableSource(type, alias)

struct DefinedTableItem <: TableItem
    ref::TableItemRef
    name::Symbol
end

struct SetReturningFunctionTableItem{T} <: TableItem
    ref::TableItemRef
    fieldnames::Tuple
    f::SetReturningFunctionCall{T}
end

struct RefTableItem <: TableItem
    ref::TableItemRef
end

struct ValuesTableItem{T} <: TableItem
    ref::TableItemRef
    fieldnames::Tuple
    values::AbstractVector{T}
end

function ValuesTableItem(values::AbstractVector{T}, fieldnames::Tuple, aliashint=:vals) where {T<:Tuple}
    @assert length(values) > 0
    @assert length(T.types) == length(fieldnames)
    ref = TableItemRef(aliashint)
    ValuesTableItem(ref, fieldnames, values)
end