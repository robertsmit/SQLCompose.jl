function generate(path::String, connstr::String; modulename::Symbol=:Database, schema::String="public", kwargs...)
    reltypes = sc_relationtypes(connstr, schema)
    defs = queries_expression(reltypes; kwargs...)
    result = wrapmodule(defs, modulename)
    mkpath(dirname(path))
    open(path, "w") do io
        print(io, result)
    end
end

function wrapmodule(expr, modulename)
    result = quote
        module $modulename
        using SQLCompose
        $(expr)
        end
    end
    result_without_begin = result.args[2]
    return result_without_begin
end

chop_postfix(from, postfix) = chop(from; tail=length(postfix))

function referencefieldname(fieldname::String, postfixmappings)
    postfixindex = findfirst((each) -> endswith(fieldname, first(each)), postfixmappings)
    if isnothing(postfixindex)
        return fieldname
    end
    (postfix, mapper) = postfixmappings[postfixindex]
    mapper(fieldname, postfix)
end

function ref_methodname(key::ForeignKey, postfixmappings; defaultname=key.parentname)
    let ref = key.parentfields == key.childfields ? defaultname :
              let fieldnames = map(each -> referencefieldname(string(each), postfixmappings), key.childfields)
            join(fieldnames, "_")
        end
        Symbol(ref, "_of")
    end
end

function backref_methodname(childname::Symbol, key::ForeignKey, postfixmappings)
    Symbol("all_", ref_methodname(key, postfixmappings; defaultname=childname))
end

function rowstruct_expression(reltype, typename)
    fnames = field_names(reltype)
    :(struct $typename <: SQLCompose.RowStruct{$(reltype.rowtype)}
        $(fnames...)
    end)
end

function queries_expression(types;
    withexports=true,
    typename=tablename -> Symbol(tablename |> string |> titlecase),
    referencename=name -> name |> typename |> string |> lowercase |> Symbol,
    referencefieldname_postfixmappings=("_id" => chop_postfix,))

    ref_methodexpression(key::ForeignKey, childname, methodname) =
        let childtypename = typename(childname)
            parenttypename = typename(key.parentname)
            childfield_exprs = map(childkey -> :($childname.$(childkey)), key.childfields)
            :($methodname($childname::$childtypename) = SQLCompose.reference($parenttypename, $(key.parentfields), ($(childfield_exprs...),)))
        end

    backref_methodexpression(key::ForeignKey, childname, methodname) =
        let childtypename = typename(childname)
            parenttypename = typename(key.parentname)
            parentfield_exprs = map(parentkey -> :($(key.parentname).$(parentkey)), key.parentfields)
            :($methodname($(key.parentname)::$parenttypename) = SQLCompose.reference($childtypename, $(key.childfields), ($(parentfield_exprs...),)))
        end

    typenames = (typename(name(t)) for t in types)
    rowstruct_exprs = (rowstruct_expression(each...) for each in zip(types, typenames))

    allforeignkeys = ((key=fk, childname=name(type))
                      for type in types for fk in type.foreignkeys)
    ref_methodnames = (ref_methodname(key, referencefieldname_postfixmappings; defaultname=referencename(key.parentname)) for (key,) in allforeignkeys)
    backref_methodnames = (backref_methodname(referencename(childname), key, referencefieldname_postfixmappings) for (key, childname) in allforeignkeys)
    ref_methodexprs = (ref_methodexpression(each.key, each.childname, methodname)
                       for (each, methodname) in zip(allforeignkeys, ref_methodnames))
    backref_methodexprs = (backref_methodexpression(each.key, each.childname, methodname)
                           for (each, methodname) in zip(allforeignkeys, backref_methodnames))

    #exports
    exports = withexports ? (typenames, ref_methodnames, backref_methodnames) : ()

    quote
        $(map(n -> :(export $(n...)), exports)...)
        $(rowstruct_exprs...)
        $(ref_methodexprs...)
        $(backref_methodexprs...)
    end
end