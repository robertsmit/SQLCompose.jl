Alias = Union{Symbol,String}

# field alias for alias
field_alias(field, ::Nothing) = "elem1"
field_alias(field::TableItemFieldRef, ::Nothing) = field.name
field_alias(field, alias) = alias
field_alias(field, ::Missing) = missing

join_alias(::Missing, ::Any) = missing
join_alias(::Nothing, s::Symbol) = s
join_alias(::Nothing, i::Integer) = "elem$i"
join_alias(s1::Alias, s2::Union{Symbol,Integer}) = "$(s1)_$(s2)"


#iterates each field
foreach_field(f::Function, result::T; index=0, alias=nothing) where {T} =
    foreach_field(f::Function, result, NodeCompositionStyle(T); index, alias)

function foreach_field(f::Function, field, ::NodeElement; index, alias)
    fieldindex = index + 1
    ismissing(alias) ? f(field, fieldindex) : f(field, field_alias(field, alias), fieldindex)
    fieldindex
end

function foreach_field(f::Function, result, ::NodeStructure; index, alias)
    for (key, v) in pairs(result)
        index = foreach_field(f, v; index, alias=join_alias(alias, key))
    end
    index
end

#maps result in same structure 
mapfields(f::Function, result::T; alias=nothing) where {T} =
    mapfields(f::Function, result, NodeCompositionStyle(T); alias)
mapfields(f::Function, field, ::NodeElement; alias) = ismissing(alias) ? f(field) : f(field, field_alias(field, alias))
mapfields(::Function, result, ::NodeStructure; alias) = error("Please implement mapfields function for", typeof(result))

mapfields(f::Function, result::T; alias=nothing) where {T<:NodeList} = Tuple(mapfields(f, x; alias=join_alias(alias, i)) for (i, x) in pairs(result))
mapfields(f::Function, result::NamedTuple{K}; alias=nothing) where {K} = NamedTuple{K}(mapfields(f, x; alias=join_alias(alias, i)) for (i, x) in pairs(result))

convert_fields(type, result) = mapfields((f) -> convert(type, f), result; alias=missing)