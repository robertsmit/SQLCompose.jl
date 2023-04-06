
pg_relations(conn::LibPQ.Connection, schema::String) =
    rows(
        conn,
        """select c.oid oid, relname from pg_class c
            join pg_namespace pn on c.relnamespace = pn.oid
            where pn.nspname = '$schema'
                and relkind = any('{"p", "r", "v", "m", "f", "c"}')
                and not relispartition    
            order by relname;"""
    )


pg_type_columns = "typname, typtype, typlen = -1 and typelem <> 0 isarray, typelem, typbasetype, typrelid, oid"

pg_relation_fieldtypes(conn::LibPQ.Connection, tablerow::LibPQ.Row) = pg_fieldtypes(conn, tablerow.oid)
pg_type_fieldtypes(conn::LibPQ.Connection, fieldrow::LibPQ.Row) = pg_fieldtypes(conn, fieldrow.typrelid)

pg_fieldtypes(conn::LibPQ.Connection, relid) = rows(
    conn,
    "select attname, $pg_type_columns 
            from pg_attribute pa
        join pg_type pt on pa.atttypid = pt.oid
        where attrelid = $relid and not attisdropped and attnum > 0
        order by attnum;"
)

pg_foreignkeys(conn::LibPQ.Connection, relid) = rows(conn,
    """
    select c.oid,
           c.confrelid::regclass as parentname,
           attparent.attname     as parentattname,
           attchild.attname      as childattname
    from (select c.oid, c.conname, c.conrelid, c.confrelid, unnest(c.conkey) childkey, unnest(c.confkey) parentkey
          from pg_constraint c
          where contype = 'f' and c.conrelid = $relid) as c
             join pg_attribute attchild on attchild.attrelid = c.conrelid and attchild.attnum = c.childkey
             join pg_attribute attparent on attparent.attrelid = c.confrelid and attparent.attnum = c.parentkey
             """)

pg_primarykey(conn::LibPQ.Connection, relid) = rows(conn,
    """
    select c.oid, att.attname
    from (select c.oid, c.conrelid, unnest(c.conkey) conkey
    from pg_constraint c
    where contype = 'p' and c.conrelid = $relid) as c
        join pg_attribute att on att.attrelid = c.conrelid and att.attnum = c.conkey
             """)



pg_fieldname(r::LibPQ.Row) = Symbol(r.attname)
pg_fieldnames(r::LibPQ.Result) = Tuple(map(pg_fieldname, r))

pg_type(conn::LibPQ.Connection, oid) = row(conn, "select $pg_type_columns from pg_type where oid = $oid")
pg_elemtype(conn::LibPQ.Connection, fieldrow::LibPQ.Row) = pg_type(conn, fieldrow.typelem)

function pg_range_elemtype(conn::LibPQ.Connection, oid)
    return row(
        conn,
        "select $pg_type_columns from pg_range r
join pg_type pt on r.rngsubtype = pt.oid
where r.rngtypid = $oid"
    )

end

pg_basetype(conn::LibPQ.Connection, fieldrow::LibPQ.Row) = pg_type(conn, fieldrow.typbasetype)

rows(conn::LibPQ.Connection, query) = Tables.rows(LibPQ.execute(conn, query))
row(conn::LibPQ.Connection, query) = only(rows(conn, query))