abstract type RowStruct{T} <: SQLNode end

NodeCompositionStyle(::Type{<:RowStruct}) = NodeStructure()

field_names(::Type{<:RowStruct{T}}) where {T} = field_names(T)
field_pairs(::Type{<:RowStruct{T}}) where {T} = field_pairs(T)
field_names(::RowStruct{T}) where {T} = field_names(T)
name(::Type{<:RowStruct{T}}) where {T} = name(T)

tableresult(ref::TableItemRef, rst::Type{<:RowStruct}) =
    rst((TableItemFieldRef(name, type, ref)
         for (name, type) in field_pairs(rst))...)



SelectQuery(type::Type{<:RowStruct}) = SelectQuery(TableSource(type))

aliashint(type::Type{<:RowStruct}) = aliashintdefault(name(type))

→(type::Type{<:RowStruct}, alias::Symbol) = TableSource(type, alias)

function Base.pairs(rs::RowStruct{T}) where {T}
    Base.Pairs(rs, SQLCompose.field_names(rs))
end

Base.NamedTuple(rs::RowStruct) = NamedTuple(collect(pairs(rs)))

function mapfields(f::Function, result::T; alias=nothing) where {T<:RowStruct}
    T((mapfields(f, fieldvalue; alias=join_alias(alias, fieldname)) for (fieldname, fieldvalue) in pairs(result))...)
end

function write_referredtable_location_plan!(plan, node::T, tableitem) where {T<:RowStruct}
    for each in node
        write_referredtable_location_plan!(plan, each, tableitem)
    end
end

function reference(to::Type{<:RowStruct}, primarykeys::Tuple, foreignkeys::Tuple, isnullable=false)
    ref = ReferredTableItemRef(name(to), primarykeys, foreignkeys, isnullable)
    to((TableItemFieldRef(fname, ftype, ref) for (fname, ftype) in field_pairs(to))...)
end

reference(to::Type{<:RowStruct}, primarykey, foreignkey, isnullable=false) = reference(to, (primarykey,), (foreignkey,), isnullable)

function Base.show(io::IO, node::RowStruct)
    print(io, "(")
    foreach_field(node) do field, alias, index
        index == 1 || print(io, ", ")
        print(io, alias)
        print(io, " = ")
        print(io, string(field))
    end
    print(io, ")")
end

@generated function Base.iterate(rs::RowStruct{T}, state=1) where {T}
    fnames = field_names(rs)
    statements = (
        quote
            if state == $i
                return (rs.$f, $(i + 1))
            end
        end for (i, f) in pairs(fnames)
    )
    quote
        if state > $(length(fnames))
            return nothing
        end
        $(statements...)
    end
end

Base.getindex(row::RowStruct, i::Int) = getfield(row, field_names(row)[i])
Base.getindex(row::RowStruct, f::Symbol) = getfield(row, f)
Base.length(row::RowStruct) = length(field_names(row))
Base.merge(nt::NamedTuple, row::RowStruct) = merge(nt, pairs(row))