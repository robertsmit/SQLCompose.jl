abstract type RowStruct{T} <: SQLNode end

NodeCompositionStyle(::Type{RowStruct}) = NodeStructure()

field_names(::Type{<:RowStruct{T}}) where {T} = field_names(T)
field_pairs(::Type{<:RowStruct{T}}) where {T} = field_pairs(T)
field_names(::RowStruct{T}) where {T} = field_names(T)
name(::Type{<:RowStruct{T}}) where {T} = name(T)

tableresult(ref::TableItemRef, rst::Type{<:RowStruct}) =
    rst((TableItemFieldRef(name, type, ref)
          for (name, type) in field_pairs(rst))...)


SelectQuery(type::Type{<:RowStruct}) = SelectQuery(TableSource(type))

→(type::Type{<:RowStruct}, alias::Symbol) = TableSource(type, alias)


@generated function Base.pairs(rs::RowStruct{T}) where {T}
    fnames = field_names(T)
    p = (:($(QuoteNode(fname)) => rs.$fname) for fname in fnames)
    quote
        ($(p...),)
    end
end

Base.NamedTuple(rs::RowStruct) = NamedTuple(collect(pairs(rs)))

function foreachfield(f::Function, result::T, alias, index) where {T<:RowStruct}
    let i = index
        fnames = field_names(T)
        for fieldname in fnames
            i = foreachfield(f, getfield(result, fieldname), nextalias(alias, fieldname), i)
        end
        i
    end
end

function mapfields(f::Function, result::T, alias) where {T<:RowStruct}
    T((mapfields(f, getfield(result, fname), nextalias(alias, fname)) for fname in field_names(T))...)
end

function write_referredtable_location_plan!(plan, node::T, tableitem) where {T<:RowStruct}
    for fname in field_names(T)
        write_referredtable_location_plan!(plan, getfield(node, fname), tableitem)
    end
end

function reference(to::Type{<:RowStruct}, primarykeys::Tuple, foreignkeys::Tuple, isnullable=false)
    ref = ReferredTableItemRef(name(to), primarykeys, foreignkeys, isnullable)
    to((TableItemFieldRef(fname, ftype, ref) for (fname, ftype) in field_pairs(to))...)
end

reference(to::Type{<:RowStruct}, primarykey, foreignkey, isnullable=false) = reference(to, (primarykey,), (foreignkey,), isnullable)

function Base.show(io::IO, node::RowStruct)
    print(io, "(")
    foreachfield(node) do field, alias, index
        index == 1 || print(io, ", ")
        print(io, alias)
        print(io, " = ")
        print(io, string(field))
    end
    print(io, ")")
end
