struct LateralTableItemRef <: TableItemRef
    tablename::Symbol
    primarykeys
    foreignkeys
    isnullable::Bool
end

function aliashint(ref::LateralTableItemRef)
    Symbol("lat_", ref.tablename)
end

function lateral(table::TableDefinition, primarykeys::Tuple, foreignkeys, isnullable=false)
    ref = LateralTableItemRef(name(table), primarykeys, foreignkeys, isnullable)
    NamedTuple{field_names(table)}(TableItemFieldRef(name, type, ref) for (name, type) in field_pairs(table))
end

lateral(table::TableDefinition, primarykey::Symbol, foreignkey, isnullable=false) =
    lateral(table, Tuple(primarykey), Tuple(foreignkey), isnullable)