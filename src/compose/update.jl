
update(q::UpdateStatement) = q
update(q::QuerySource) = update(TableSource(q))
function update(source::TableSource)
    item = DefinedTableItem(source)
    itemresult = tableresult(item.ref, source)
    UpdateStatement(item, itemresult, itemresult, itemresult, nothing, true, nothing)
end

function set(f::Function, stmnt::UpdateStatement)
    changed = f(result_args(stmnt.result)...)
    actualchanges = NamedTuple(field => value for (field, value) in pairs(changed) if stmnt.itemresult[field] !== value)
    if length(actualchanges) == 0
        error("Nothing changed")
    end
    with_changes(stmnt, actualchanges)
end

# function join(f::Function, left::UpdateStatement, right::Queryable; type::JoinType=InnerJoin())
#     right = joinable_right(right)
#     args = result_args(left.result, right.result)
#     condition = convert(BooleanExpression, f(args...))
#     join(left, left.from, right; condition, type)
# end

# function join(left::UpdateStatement, ::Nothing, right::SelectQuery; condition, type::JoinType=InnerJoin())
#     @assert type == InnerJoin()
#     result = with_filter(left, left.filter & condition)
#     with_from(result, right.from)
# end

# function join(left::UpdateStatement, leftfrom::FromItem, right::SelectQuery; condition, type::JoinType=InnerJoin())
#     @assert type == InnerJoin()
#     result = with_filter(left, left.filter & right.filter)
#     joinvalue = EquiJoin(type, condition)
#     joinitem = JoinItem(leftfrom, right.from, joinvalue)
#     with_from(result, joinitem)
# end