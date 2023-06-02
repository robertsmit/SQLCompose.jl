# update(source, others::) = UpdateStatement(source)

update(f::Function, source::TableSource) = 




struct UpdateStatement <: SQLNode
    commontables::Tuple
    source::TableSource
    changes
    fromItems
    filter
    result
    returning
    UpdateStatement(source::TableSource) = new((), source, )
end

UpdateStatement(source::Queryable) = query(source)
function UpdateStatement(source::SelectQuery)

end