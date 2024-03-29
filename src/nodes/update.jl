@value struct UpdateStatement <: SQLCommand
    item::DefinedTableItem
    itemresult
    result
    changes
    from::Union{Nothing, FromItem}
    filter::BooleanExpression
    returning    
end

#with_filter(d::UpdateStatement, filter) = UpdateStatement(d.source, d.changes, d.from, filter, d.returning, d.result)
#with_changes(d::UpdateStatement, c) = UpdateStatement(d.source, c, d.from, d.filter, d.returning, d.result)