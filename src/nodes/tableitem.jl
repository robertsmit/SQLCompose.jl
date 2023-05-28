aliashintdefault(name::Symbol, len=1) =
    let str = string(name)
        Symbol(str[1:min(len, length(str))])
    end

abstract type FromItem <: SQLNode end

abstract type TableItem <: FromItem end

abstract type TableItemRef <: SQLNode end

struct KeyedTableItemRef <: TableItemRef
    key::Symbol
end

key(ref::KeyedTableItemRef) = ref.key
key(tableitem::TableItem) = key(tableitem.ref)

TableItemRef() = KeyedTableItemRef(gensym())

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
aliashint(source::TableSource) = source.aliashint

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
    aliashint::Symbol
end
aliashint(item::DefinedTableItem) = item.aliashint

struct SetReturningFunctionTableItem{T} <: TableItem
    ref::TableItemRef
    fieldnames::Tuple
    f::SetReturningFunctionCall{T}
end

aliashint(ref::SetReturningFunctionTableItem) = aliashintdefault(ref.f.name)


struct RefTableItem <: TableItem
    ref::TableItemRef
end
aliashint(item::RefTableItem) = error("reftalbeitme")

struct ValuesTableItem{T} <: TableItem
    ref::TableItemRef
    fieldnames::Tuple
    values::AbstractVector{T}
    aliashint::Symbol
end
aliashint(item::ValuesTableItem) = item.aliashint

function ValuesTableItem(values::AbstractVector{T}, fieldnames::Tuple, aliashint) where {T<:Tuple}
    @assert length(values) > 0
    @assert length(T.types) == length(fieldnames)
    ref = TableItemRef()
    ValuesTableItem(ref, fieldnames, values, aliashint)
end