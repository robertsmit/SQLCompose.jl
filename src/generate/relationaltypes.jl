struct ForeignKey
    parentname::Symbol
    parentfields::Tuple
    childfields::Tuple
end

ForeignKey(parentname, fields) = ForeignKey(parentname, fields, fields)

struct RelationType
    type::Type{<:RowType}
    foreignkeys::Tuple
end

RelationType(type) = RelationType(type, ())

name(rt::RelationType) = name(rt.type)
field_names(rt::RelationType) = field_names(rt.type)
field_pairs(rt::RelationType) = field_pairs(rt.type)


function sc_relationtypes(connstr::String, schema::String="public")
    conn = LibPQ.Connection(connstr)
    try
        sc_relationtypes(conn, schema)
    finally
        close(conn)
    end
end

sc_relationtypes(conn::LibPQ.Connection, schema::String="public") =
    [sc_relationtype(conn, row) for row in pg_relations(conn, schema)]

function sc_relationtype(conn::LibPQ.Connection, rel)
    rowtype = sc_relationmetatype(conn, rel.oid, Symbol(rel.relname))
    foreignkeys = sc_relationforeignkeys(conn, rel.oid)
    RelationType(rowtype, foreignkeys)
end

function sc_relationforeignkeys(conn::LibPQ.Connection, oid)
    fkeys = pg_foreignkeys(conn, oid)
    groupedfkeys = reduce(fkeys, init=Dict()) do acc, each
        let current = get(acc, each.oid, ForeignKey(Symbol(each.parentname), (), ()))
            acc[each.oid] = ForeignKey(current.parentname, (current.parentfields..., Symbol(each.parentattname)),
                (current.childfields..., Symbol(each.childattname)))
            acc
        end
    end
    Tuple(values(groupedfkeys))
end

function sc_relationmetatype(conn::LibPQ.Connection, oid, name)
    fields = pg_fieldtypes(conn, oid)
    names = pg_fieldnames(fields)
    mtypes = sc_metatypes(conn, fields)
    RowType{Symbol(name),names,Tuple{mtypes...}}
end

sc_metatypes(conn::LibPQ.Connection, pg_types::LibPQ.Result) = [sc_metatype(conn, row) for row in pg_types]

const tt_base = 'b'
const tt_enum = 'e'
const tt_domain = 'd'
const tt_composite = 'c'
const tt_range = 'r'
const tt_multirange = 'm'
const tt_pseudo = 'p'

function sc_metatype(conn::LibPQ.Connection, row::LibPQ.Row)
    typtype = row.typtype

    if typtype == tt_base
        sc_basemetatype(conn, row)
    elseif typtype == tt_enum
        EnumType
    elseif typtype == tt_domain
        sc_metatype(conn, pg_basetype(conn, row))
    elseif typtype == tt_composite
        sc_relationmetatype(conn, row.typrelid, row.typname)
    elseif typtype == tt_range
        elemtype = sc_metatype(conn, pg_range_elemtype(conn, row.oid))
        RangeType{elemtype}
    elseif typtype == tt_multirange
        @error "not implemented yet: multirange"
    elseif typtype == tt_pseudo
        @error "should not occur"
    else
        @error "not implemented yet: typtype=$typtype"
    end
end

function sc_arraymetatype(conn, row)
    elem_metatype = sc_metatype(conn, pg_elemtype(conn, row))
    ArrayType{elem_metatype}
end

function sc_basemetatype(conn, row)
    if row.isarray
        return sc_arraymetatype(conn, row)
    end
    name = row.typname
    metatype = get(sc_metatypedict, name, UnknownType)
    metatype == UnknownType && @warn "Unknown type $name"
    metatype
end

sc_metatypedict = Dict(
    "bool" => BooleanType,
    "int2" => Int2Type,
    "int4" => Int4Type,
    "int8" => Int8Type,
    "float4" => Float4Type,
    "float8" => Float8Type,
    "numeric" => DecimalType, "interval" => IntervalType,
    "timestamp" => TimestampType,
    "timestamptz" => TimestampType,
    "date" => DateType,
    "time" => TimeType,
    "timetz" => TimeType, "bytea" => BlobType,
    "bpchar" => CharType,
    "varchar" => VarCharType,
    "text" => TextType,
    "citext" => TextType,
    "uuid" => UUIDType,
    "jsonb" => JSONType
)


