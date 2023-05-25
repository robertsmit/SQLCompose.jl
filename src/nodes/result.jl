Alias = Union{Symbol, String}

# field alias for path
fieldalias(field, ::Nothing) = fieldalias(1)
fieldalias(field::TableItemFieldRef, ::Nothing) = field.name
fieldalias(field, alias) = alias
fieldalias(i::Integer) = "elem$i"

nextalias(::Nothing, i::Integer) = fieldalias(i)
nextalias(::Nothing, s::Symbol) = s
nextalias(s1::Alias, s2::Symbol) = "$(s1)_$(s2)"
nextalias(s1::Alias, i::Integer) = "$(s1)_$i"

#iterates each field
foreachfield(f::Function, result) = foreachfield(f, result, nothing, 1) 

foreachfield(f::Function, result::T, alias, index) where {T} = 
    foreachfield(f::Function, result, alias, index, NodeCompositionStyle(T))
foreachfield(f::Function, field, alias, index, ::NodeElement) = (f(field, fieldalias(field, alias), index); index + 1)
foreachfield(f::Function, field, alias, index, ::NodeStructure) = error("Please implement foreachfield function for", typeof(field))
function foreachfield(f::Function, result::NodeList, alias, index)
    for (n,v) in pairs(result)
        index = foreachfield(f, v, nextalias(alias, n), index)
    end
    index
end