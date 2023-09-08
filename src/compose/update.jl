
update(q::UpdateStatement) = q
update(q::QuerySource) = update(TableSource(q))
function update(source::TableSource)
    item = DefinedTableItem(source)
    itemresult = tableresult(item.ref, source)
    UpdateStatement(item, itemresult, itemresult, itemresult, nothing, true, nothing)
end

function set(f::Function, stmnt::UpdateStatement)
    changes = f(result_args(stmnt.result)...)
    set(stmnt, changes)
end

function set(stmnt::UpdateStatement, changes::NamedTuple)
    actualchanges = get_actualchanges(stmnt, changes)
    if length(actualchanges) == 0
        return with_changes(stmnt, changes)
    end
    with_changes(stmnt, actualchanges)
end

function set(stmnt::UpdateStatement, changes::Query)
    with_changes(stmnt, changes)
end

function get_actualchanges(stmnt::UpdateStatement, changes)
    NamedTuple(
        field => convert(SQLExpression{sqltypeof(stmnt.itemresult[field])}, value)
        for (field, value) in pairs(changes)
        if stmnt.itemresult[field] !== value)
end

map(f::Function, q::UpdateStatement) = with_returning(q, map_result(f, q.result))