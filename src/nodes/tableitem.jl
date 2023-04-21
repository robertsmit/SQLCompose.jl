export TableDefinition

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

struct TableDefinition
    type::Type{<:RowType}
    aliashint::Symbol
end



aliashintdefault(name::Symbol, len = 1) = let str = string(name)
    Symbol(str[1:min(len, length(str))])
end

TableDefinition(type::Type{<:RowType{name,fieldnames,T}}) where {name,fieldnames,T} = TableDefinition(type, aliashintdefault(name))
TableDefinition(name::Symbol, pairs::Pair...; aliashint=aliashintdefault(name)) =
    let nt = NamedTuple(pairs)
        TableDefinition(RowType{name,keys(nt),Tuple{values(nt)...}}, aliashint)
    end

→(table::TableDefinition, alias::Symbol) = TableDefinition(table.type, alias)
name(table::TableDefinition) = name(table.type)
fields(table::TableDefinition) = fields(table.type)
field_names(table::TableDefinition) = field_names(table.type)
field_pairs(table::TableDefinition) = field_pairs(table.type)

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

function ValuesTableItem(values::AbstractVector{T}, fieldnames::Tuple, aliashint = :vals) where {T<:Tuple}
    @assert length(values) > 0
    @assert length(T.types) == length(fieldnames)
    ref = TableItemRef(aliashint)
    ValuesTableItem(ref, fieldnames, values)
 end 