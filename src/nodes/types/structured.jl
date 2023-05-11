abstract type StructuredType <: SQLType end

struct RecordType <: StructuredType end

struct RowType{name,fieldnames,T<:Tuple} <: StructuredType
    types::T
end

RowType{name,fieldnames}(types::T) where {name,fieldnames,T<:Tuple} = RowType{name,fieldnames,T}(types)
RowType(name::Symbol, pairs::Pair...) =
    let nt = NamedTuple(pairs)
        RowType{name,keys(nt),Tuple{values(nt)...}}
    end
name(r::RowType) = name(typeof(r))
name(::Type{RowType{n,fns,T}}) where {n,fns,T} = n
field_names(::Type{RowType{name,fieldnames,T}}) where {name,fieldnames,T} = fieldnames
field_names(r::RowType) = field_names(typeof(r))
field_types(::Type{RowType{name,fieldnames,T}}) where {name,fieldnames,T} = fieldtypes(T)
field_types(r::RowType) = field_types(typeof(r))
field_pairs(t::Type{<:RowType}) = zip(field_names(t), field_types(t))



