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

ref(tableitem::TableItem) = tableitem.ref

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
TableSource(source::TableSource) = source
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

function DefinedTableItem(table::TableSource)
    ref = TableItemRef()
    DefinedTableItem(ref, name(table), aliashint(table))
end

struct SetReturningFunctionTableItem{T} <: TableItem
    ref::TableItemRef
    fieldnames::Tuple
    func::SetReturningFunctionCall{T}
end
aliashint(item::SetReturningFunctionTableItem) = aliashintdefault(item.func.name)

struct RefTableItem <: TableItem
    ref::TableItemRef
end
aliashint(item::RefTableItem) = :a

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


abstract type Join <: SQLNode end

struct JoinItem <: FromItem
    left::FromItem
    right::TableItem
    join::Join
end

abstract type JoinType end
struct InnerJoin <: JoinType end
struct LeftJoin <: JoinType end
struct RightJoin <: JoinType end
struct FullJoin <: JoinType end

struct EquiJoin <: Join
    type::JoinType
    condition::BooleanExpression
end

struct LateralJoin <: Join
    type::JoinType
    condition::BooleanExpression
end

struct ReferredTableItemRef <: TableItemRef
    tablename::Symbol
    primarykeys
    foreignkeys
    isnullable::Bool
end

DefinedTableItem(ref) = DefinedTableItem(ref, ref.tablename, Symbol("ref_", ref.tablename))

function reference(table::TableSource, primarykeys::Tuple, foreignkeys, isnullable=false)
    ref = ReferredTableItemRef(name(table), primarykeys, foreignkeys, isnullable)
    tableresult(ref, table)
end

reference(table::TableSource, primarykey::Symbol, foreignkey, isnullable=false) =
    reference(table, Tuple(primarykey), Tuple(foreignkey), isnullable)


struct UnmergedResult
    results::Tuple
end

tableresult(ref::TableItemRef, fnames, ftypes) =
    NamedTuple{fnames}(TableItemFieldRef(name, type, ref) for (name, type) in zip(fnames, ftypes))
tableresult(ref::TableItemRef, type::Type{<:RowType}) = tableresult(ref, field_names(type), field_types(type))
tableresult(ref::TableItemRef, source::TableSource) = tableresult(ref, source.type)