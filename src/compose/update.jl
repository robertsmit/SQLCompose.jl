# update(source, others::) = UpdateStatement(source)


# struct UpdateStatement <: SQLNode
#     commontables::Tuple
#     source::TableSource
#     changes
#     fromItems
#     filter
#     result
#     returning
#     UpdateStatement(source::TableSource) = new((), source, )
# end

