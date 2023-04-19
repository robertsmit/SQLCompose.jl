abstract type RowStruct{T} <: SQLNode end

NodeCompositionStyle(::Type{RowStruct}) = NodeStructure()

table(::Type{<:RowStruct{T}}) where {T} = TableDefinition(T)
table(rs::RowStruct) = table(typeof(rs))
field_names(::Type{<:RowStruct{T}}) where {T} = field_names(T)
field_names(::RowStruct{T}) where {T} = field_names(T)

function SelectQuery(type::Type{<:RowStruct})
    let tab = table(type)
        ref = TableItemRef(tab.aliashint)
        result = type((TableItemFieldRef(name, type, ref)
                       for (name, type) in field_pairs(tab))...)
        table = DefinedTableItem(ref, name(tab))
        SelectQuery(result, table)
    end
end

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

function writelateralplan!(plan, node::T, tableitem) where {T<:RowStruct}
    for fname in field_names(T)
        writelateralplan!(plan, getfield(node, fname), tableitem)
    end
end

function lateral(to::Type{<:RowStruct}, primarykeys::Tuple, foreignkeys, isnullable=false)
    let tab = table(to)
        ref = LateralTableItemRef(name(tab), primarykeys, foreignkeys, isnullable)
        to((TableItemFieldRef(fname, ftype, ref) for (fname, ftype) in field_pairs(tab))...)
    end
end

lateral(to::Type{<:RowStruct}, primarykey, foreignkey, isnullable=false) = lateral(to, (primarykey,), (foreignkey,), isnullable)

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
