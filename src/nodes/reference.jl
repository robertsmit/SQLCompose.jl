struct ReferredTableItemRef <: TableItemRef
    tablename::Symbol
    primarykeys
    foreignkeys
    isnullable::Bool
end

key(ref::ReferredTableItemRef) = ref


DefinedTableItem(ref) = DefinedTableItem(ref, ref.tablename, Symbol("ref_", ref.tablename))

function reference(table::TableSource, primarykeys::Tuple, foreignkeys, isnullable=false)
    ref = ReferredTableItemRef(name(table), primarykeys, foreignkeys, isnullable)
    NamedTuple{field_names(table)}(TableItemFieldRef(name, type, ref) for (name, type) in field_pairs(table))
end

reference(table::TableSource, primarykey::Symbol, foreignkey, isnullable=false) =
    reference(table, Tuple(primarykey), Tuple(foreignkey), isnullable)