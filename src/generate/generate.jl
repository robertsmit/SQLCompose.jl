
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

function tabledefinition_expression(type)
    :(SQLCompose.TableDefinition($(QuoteNode(name(type))),
        $(map(n -> :($(QuoteNode(first(n))) => $(last(n))), field_pairs(type))...);
        aliashint=$(QuoteNode(aliashintdefault(name(type))))))
end


chop_postfix(from, postfix) = chop(from; tail=length(postfix))

function lateralfieldname(fieldname::String, postfixmappings)
    postfixindex = findfirst((each) -> endswith(fieldname, first(each)), postfixmappings)
    if isnothing(postfixindex)
        return fieldname
    end
    (postfix, mapper) = postfixmappings[postfixindex]
    mapper(fieldname, postfix)

end

function reference_methodname(key::ForeignKey, postfixmappings)
    let ref = key.parentfields == key.childfields ? key.parentname :
              let fieldnames = map(each -> lateralfieldname(string(each), postfixmappings), key.childfields)
            join(fieldnames, "_")
        end
        Symbol(ref, "_of")
    end
end

tabledefinition_methodname(rt) = Symbol(name(rt), "_table")


namedquery_methodname(rt) = Symbol("query_", name(rt))

function rowstruct_expression(reltype, typename)
    fnames = field_names(reltype)
    typestructdef = :(struct $typename <: SQLCompose.RowStruct{$(reltype.rowtype)}
        $(fnames...)
    end)
    querydef = :(
        let q = SQLCompose.SelectQuery($typename)
            global SQLCompose.query(::Type{$typename}) = q
        end
    )
    querysetdef = :(SQLCompose.query(::Type{$typename}, executor::SQLCompose.AbstractQueryExecutor) = SQLCompose.QuerySet(query($typename), executor))

    tabledef =  :($(tabledefinition_methodname(reltype))() = SQLCompose.table($typename))

    namedquerydef = :($(namedquery_methodname(reltype))() = query($typename))
    namedquerysetdef = :($(namedquery_methodname(reltype))(executor::SQLCompose.AbstractQueryExecutor) = query($typename, executor))

    foreachfielddef = :(
        function SQLCompose.foreachfield(f::Function, result::$typename, alias, index)
            let i = index
                $((:(i = SQLCompose.foreachfield(f, result.$f, SQLCompose.nextalias(alias, $(QuoteNode(f))), i)) for f in fnames)...)
            end
        end
    )
    mapfieldsdef = :(
        function SQLCompose.mapfields(f::Function, result::$typename, alias)
            $typename($((:(SQLCompose.mapfields(f, result.$f, SQLCompose.nextalias(alias, $(QuoteNode(f))))) for f in fnames)...))
        end
    )
    writelateralplandef = :(
        function SQLCompose.write_referredtable_location_plan!(plan, node::$typename, tableitem)
            $((:(SQLCompose.write_referredtable_location_plan!(plan, node.$f, tableitem)) for f in fnames)...)
        end
    )

    quote
        $(typestructdef)
        $(tabledef)
        $(querydef)
        $(querysetdef)
        $(namedquerydef)
        $(namedquerysetdef)
        $(foreachfielddef)
        $(mapfieldsdef)
        $(writelateralplandef)
    end
end

function queries_expression(types;
    withexports=true,
    rowstruct_typename=tablename -> Symbol(tablename |> string |> titlecase, "Row"),
    referencefieldname_postfixmappings=("_id" => chop_postfix,))

    refference_methodexpression(key::ForeignKey, childname, methodname) =
        let childtypename = rowstruct_typename(childname)
            parenttypename = rowstruct_typename(key.parentname)
            childfield_exprs = map(childkey -> :($childname.$(childkey)), key.childfields)
            :($methodname($childname::$childtypename) = SQLCompose.reference($parenttypename, $(key.parentfields), ($(childfield_exprs...),)))
        end

    rowstruct_typenames = (rowstruct_typename(name(t)) for t in types)
    rowstruct_exprs = (rowstruct_expression(each...) for each in zip(types, rowstruct_typenames))

    allforeignkeys = ((key=fk, childname=name(type))
                      for type in types for fk in type.foreignkeys)
    refference_methodnames = (reference_methodname(key, referencefieldname_postfixmappings) for (key,) in allforeignkeys)
    reference_methodexprs = (refference_methodexpression(each.key, each.childname, methodname)
                           for (each, methodname) in zip(allforeignkeys, refference_methodnames))

    #exports
    tabledefintions_methodnames = map(tabledefinition_methodname, types)
    namedquery_methodnames = map(namedquery_methodname, types)
    exports = withexports ? (rowstruct_typenames, refference_methodnames, tabledefintions_methodnames, namedquery_methodnames) : ()

    quote
        $(map(n -> :(export $(n...)), exports)...)
        $(rowstruct_exprs...)    
        $(reference_methodexprs...)
    end
end