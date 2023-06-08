
update(q::UpdateStatement) = q
update(q::QuerySource) = update(TableSource(q))
function update(source::TableSource)
    item = DefinedTableItem(source)
    result = tableresult(item.ref, source)
    UpdateStatement(item, (), (), true, nothing, result)
end

function set(f::Function, stmnt::UpdateStatement)
    changed = f(stmnt.result)
    actualchanged = NamedTuple(field => value for (field, value) in pairs(changed) if stmnt.result[field] !== value)
    if length(actualchanged) == 0
        error("Nothing changed")
    end
    with_changes(stmnt, actualchanged)
end

function join(f::Function, left::UpdateStatement, right::Queryable; type::JoinType=InnerJoin())
    right = joinable_right(right)
    args = result_args(left.result, right.result)
    condition = convert(BooleanExpression, f(args...))
    join(left, left.from, right; condition, type)
end

function join(left::UpdateStatement, ::Nothing, right::SelectQuery; condition, type::JoinType=InnerJoin())
    @assert type == InnerJoin()
    result = with_filter(left, left.filter & condition)
    with_from(result, right.from)
end

function join(left::UpdateStatement, leftfrom::FromItem, right::SelectQuery; condition, type::JoinType=InnerJoin())
    @assert type == InnerJoin()
    result = with_filter(left, left.filter & right.filter)
    joinvalue = EquiJoin(type, condition)
    joinitem = JoinItem(leftfrom, right.from, joinvalue)
    with_from(result, joinitem)
end