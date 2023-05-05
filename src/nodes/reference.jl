struct ReferredTableItemRef <: TableItemRef
    tablename::Symbol
    primarykeys
    foreignkeys
    isnullable::Bool
end

function aliashint(ref::ReferredTableItemRef)
    Symbol("ref_", ref.tablename)
end

function reference(table::TableDefinition, primarykeys::Tuple, foreignkeys, isnullable=false)
    ref = ReferredTableItemRef(name(table), primarykeys, foreignkeys, isnullable)
    NamedTuple{field_names(table)}(TableItemFieldRef(name, type, ref) for (name, type) in field_pairs(table))
end

reference(table::TableDefinition, primarykey::Symbol, foreignkey, isnullable=false) =
    reference(table, Tuple(primarykey), Tuple(foreignkey), isnullable)