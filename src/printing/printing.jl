
printpsql(io::IO, child, parent, env) =
    needs_parentheses(child, parent) ? printpsql_parenthesized(io, child, env) : printpsql(io, child, env)
printpsql(io::IO, node) = printpsql(io, node, PrintEnvironment())

printpsql_field(io, field, env) = printpsql(io, field, env)
printpsql_field(io::IO, arg::Query, env) = printpsql_parenthesized(io, arg, env)
printpsql_field(io::IO, arg::SubqueryExpression, env) = printpsql(io, arg, indent(env))

printpsql_alias(io::IO, alias) = print(io, " AS $alias")
printpsql_fieldalias(io::IO, _, alias) = printpsql_alias(io, alias)
printpsql_fieldalias(io::IO, field::TableItemFieldRef, alias) = Symbol(alias) == field.name || printpsql_alias(io, alias)

printpsql(io, node, env) = error("please implement 'printpsql(::IO, ::Any, ::AbstractPrintEnvironment)' for $(node)")

printpsql_result(io::IO, ::UnmergedResult, env) = print(io, " *")
function printpsql_result(io::IO, arg, env)
    singlefield = hassingleton_field(arg)
    foreach_field(arg) do field, alias, index
        index == 1 || print(io, ",")
         singlefield ? print(io, " ") : println(io, env)
        printpsql_field(io, field, env)
        printpsql_fieldalias(io, field, alias)
    end
end


function printpsql(io::IO, raw_node::SelectQuery, parent_env)
    node, env = expand(raw_node, parent_env)
    print(io, "SELECT")
    node.unique && print(io, " DISTINCT")
    printpsql_fieldlist(io, node.uniquevalues, indent(env; levels=2); prefix=" DISTINCT ON(", postfix=")")
    printpsql_result(io, node.result, indent(env))
    println(io, env)
    print(io, "FROM ")
    printpsql(io, node.from, env)
    printpsql_filter(io, node.filter, env; prefix=indentedline("WHERE ", env))
    if !isempty(node.group)
        printpsql_fieldlist(io, node.group, indent(env); prefix=indentedline("GROUP BY ", env))
        printpsql_filter(io, node.groupfilter, indent(env); prefix=indentedline("HAVING ", env))
    end
    printpsql_fieldlist(io, node.order, indent(env); prefix=indentedline("ORDER BY ", env))
    printpsql(io, node.range, env)
end

function printpsql(io::IO, arg::SelectWithoutFromQuery, env)
    print(io, "SELECT")
    printpsql_result(io, arg.result, env)
end
global i = 0
function printpsql(io::IO, raw_node::UpdateStatement, parent_env)
    node, env = expand(raw_node, parent_env)
    print(io, "UPDATE ")
    printpsql(io, node.item, env)
    printpsql_set(io, node.changes, env)
    if !isnothing(node.from)
        print(io, " FROM ")
        printpsql(io, node.from, env)
    end
    printpsql_filter(io, node.filter, env; prefix=" WHERE ")

    if !isnothing(node.returning)
        print(io, " RETURNING ")
        printpsql(io, node.returning, env)
    end
end

function printpsql_set(io::IO, values, env)
    print(io, " SET ")
    for (i, (name, value)) in enumerate(pairs(values))
        i > 1 && print(io, ", ")
        print(io, name)
        print(io, " = ")
        printpsql(io, value, env)
    end
end

function printpsql_set(io::IO, q::Query, env)
    print(io, " SET (")
    foreach_field(q.result) do _, alias, i
        i > 1 && print(io, ", ")
        print(io, alias)
    end
    print(io, ") = (")
    printpsql(io::IO, q, env)
    print(io, ")")
end

function printpsql(io::IO, node::CaseExpression, env)
    print(io, "CASE")
    for clause in node.clauses
        print(io, " WHEN ")
        printpsql(io, clause.predicate, node, env)
        print(io, " THEN ")
        printpsql(io, clause.consequence, node, env)
    end
    if !isnothing(node.otherwise)
        print(io, " ELSE ")
        printpsql(io, node.otherwise, node, env)
    end
    print(io, " END")
end

function printpsql_filter(io, expr::BooleanExpression, env; prefix="", postfix="")
    if expr === SQLConstant(true)
        return
    end
    print(io, prefix)
    printpsql(io, expr, env)
    print(io, postfix)
end


function printpsql_fieldlist(io, node, env; prefix="", postfix="", nofix="", multiline=!hassingleton_field(node))
    field_count = foreach_field(node; alias=missing) do f, i
        i == 1 ? print(io, prefix) : print(io, ", ")
        multiline && println(io, env)
        printpsql_field(io, f, indent(env))
    end
    field_count > 0 ? print(io, postfix) : print(io, nofix)
end

function printpsql(io::IO, arg::AbstractVector, env)
    print(io, "ARRAY[")
    printpsql_elements(io, arg, env)
    print(io, "]")
end

function printpsql(io::IO, arg::AbstractRange, env)
    type = sqltypeclassof(arg)
    printpsql(io, type)
    print(io, "(")
    printpsql(io, first(arg), env)
    print(io, ", ")
    printpsql(io, last(arg), env)
    print(io, ", '[]')")
end

function printpsql_elements(io, arg::AbstractVector, env)
    for i in eachindex(arg)
        i != 1 && print(io, ", ")
        printpsql(io, arg[i], env)
    end
end

printpsql(io::IO, node::TableItemFieldRef, env) = (print(io, getalias(env, node.table)); print(io, "."); print(io, node.name))
function printpsql(io::IO, node::TableRange, env)
    haslimit = !isnothing(node.limit)
    if haslimit
        println(io, env)
        print(io, "LIMIT ")
        print(io, node.limit)
    end
    hasoffset = node.offset > 0
    if hasoffset
        if haslimit
            print(io, " ")
        else
            println(io, env)
        end
        print(io, "OFFSET ")
        print(io, node.offset)
    end
end

# operators
printpsql(io::IO, node::Not, env) = printpsql_prefix(io, :NOT, node, env)
printpsql(io::IO, node::IsNull, env) = (printpsql(io, node.expr, node, env); print(io, " IS NULL"))
printpsql(io::IO, node::IsNotNull, env) = (printpsql(io, node.expr, node, env); print(io, " IS NOT NULL"))

function printpsql(io::IO, node::Between, env)
    printpsql(io, node.subject, node, env)
    print(io, " BETWEEN ")
    printpsql(io, node.range.left, node, env)
    print(io, " AND ")
    printpsql(io, node.range.right, node, env)
end

printpsql(io::IO, node::Cast, env) = (printpsql(io, node.expr, node, env); print(io, "::"); printpsql(io, node.type))
printpsql(io::IO, node::DescOrder, env) = (printpsql(io, node.expr, node, env); print(io, " DESC"))
printpsql(io::IO, node::Or, env) = printpsql_infix(io, node, :OR, env)
printpsql(io::IO, node::And, env) =
    for i in eachindex(node.elems)
        i != 1 && print(io, " AND ")
        printpsql(io, node.elems[i], node, env)
    end

printpsql(io::IO, node::Exists, env) = (print(io, "EXISTS "); printpsql(io, node.query, node, env))
printpsql(io::IO, node::NotExists, env) = (print(io, "NOT EXISTS "); printpsql(io, node.query, node, env))

function printpsql(io::IO, node::FunctionCall, env)
    print(io, node.name)
    print(io, "(")
    printpsql_fieldlist(io, node.operands, env; multiline=false)
    print(io, ")")
end
function printpsql(io::IO, node::Concat, env)
    print(io, "CONCAT(")
    printpsql_fieldlist(io, node.expressions, env; multiline=false)
    print(io, ")")
end

printpsql(io::IO, node::SubqueryExpression, env) = begin
    print(io, "(")
    printpsql(io, node.query, env)
    print(io, ")")
end

function printpsql(io::IO, node::SubqueryTableItem, env)
    print(io, "(")
    printpsql(io, node.query, indent(unwind(env)))
    alias = getalias(env, node)
    print(io, ") $alias")
end

function printpsql(io::IO, node::DefinedTableItem, env)
    tablename = node.name
    print(io, tablename)
    alias = getalias(env, node)
    alias !== tablename && print(io, " $alias")
end

function printpsql(io::IO, node::SetReturningFunctionTableItem, env)
    printpsql(io, node.func, env.parent)
    alias = getalias(env, node)
    print(io, " $alias")
    if !isempty(node.fieldnames)
        print(io, " (")
        for (valindex, val) in enumerate(node.fieldnames)
            valindex != 1 && print(io, ", ")
            print(io, val)
        end
        print(io, ")")
    end
end

function printpsql(io::IO, node::RefTableItem, env)
    print(io, getalias(env, node))
end

function printpsql(io::IO, node::ValuesTableItem, env)
    print(io, "(VALUES ")
    for (rowindex, row) in enumerate(node.values)
        rowindex != 1 && print(io, ", ")
        print(io, "(")
        for (valindex, val) in enumerate(row)
            valindex != 1 && print(io, ", ")
            printpsql(io, val)
        end
        print(io, ")")
    end
    print(io, ")")
    # print table name
    alias = getalias(env, node)
    print(io, " AS $alias")
    # print field names
    print(io, " (")
    for (keyindex, key) in enumerate(node.fieldnames)
        keyindex != 1 && print(io, ", ")
        print(io, key)
    end
    print(io, ")")
end

function printpsql(io::IO, node::JoinItem, env)
    env_left = unwind(env, node.left)
    printpsql(io, node.left, env_left)
    println(io, env)
    printpsql_join(io, node.join)
    env_right = unwind(env, node.right)
    printpsql(io, node.right, env_right)
    printpsql_join_condition(io, node.join.condition, indent(env_right))
end

function printpsql_join_condition(io::IO, condition, env)
    print(io, indentedline("ON ", env))
    printpsql(io, condition, indent(env))
end

function printpsql_join(io::IO, node::LateralJoin)
    printpsql_join(io, node.type)
    print(io, "LATERAL ")
end
printpsql_join(io::IO, node::Join) = printpsql_join(io, node.type)
printpsql_join(io::IO, ::InnerJoin) = print(io, "INNER JOIN ")
printpsql_join(io::IO, ::LeftJoin) = print(io, "LEFT JOIN ")
printpsql_join(io::IO, ::RightJoin) = print(io, "RIGHT JOIN ")
printpsql_join(io::IO, ::FullJoin) = print(io, "FULL JOIN ")

printpsql_infix(io::IO, node::SQLNode, operator, env) = printpsql_infix(io, node.left, operator, node.right, node, env)
function printpsql_infix(io::IO, left::SQLNode, operator, right::SQLNode, parent::SQLNode, env)
    printpsql(io, left, parent, env)
    print(io, " $operator ")
    printpsql(io, right, parent, env)
end

printpsql_prefix(io::IO, operator::Symbol, node::SQLNode, env) = printpsql_prefix(io, operator, node.expr, node, env)
function printpsql_prefix(io::IO, operator, child::SQLNode, parent::SQLNode, env)
    print(io, "$operator ")
    printpsql(io, child, parent, env)
end

printpsql(io::IO, n::Number, env) = print(io, n)
printpsql(io::IO, b::Bool, env) = print(io, b)
printpsql(io::IO, b::Missing, env) = print(io, "NULL")
function printpsql(io::IO, b::Date, env)
    print(io, "'")
    print(io, year(b))
    print(io, '-')
    print(io, month(b))
    print(io, '-')
    print(io, day(b))
    print(io, "'::date")
end
function printpsql(io::IO, b::DateTime, env)
    print(io, "'")
    print(io, year(b))
    print(io, '-')
    print(io, month(b))
    print(io, '-')
    print(io, day(b))
    if hour(b) != 0 || minute(b) != 0 || second(b) != 0 || millisecond(b) != 0
        print(io, " ")
        print(io, hour(b))
        print(io, ":")
        print(io, minute(b))
        print(io, ":")
        print(io, second(b))
        if millisecond(b) > 0
            print(io, ".")
            print(io, millisecond(b))
        end
    end
    print(io, "'::timestamp")
end
printpsql(io::IO, v::String, env) = (print(io, "\'"); print(io, v); print(io, "\'"))
printpsql(io::IO, c::SQLConstant, env) = begin
    printpsql(io, c.value, env)
end
function printpsql(io::IO, node::SQLCompose.InExpression, env)
    printpsql(io, node.element, env)
    print(io, " IN ")
    printpsql_parenthesized(io, node.set, env)
end

function printpsql(io::IO, node::SQLCompose.InExpression{<:AbstractVector}, env)
    printpsql(io, node.element, env)
    print(io, " IN (")
    printpsql_elements(io, node.set, env)
    print(io, ")")
end

function printpsql(io::IO, node::CommonTableExpressionQuery, env)
    cte_env = env
    print(io, "WITH ")
    for (index, table) in enumerate(node.commontables)
        index == 1 || print(io, ",")
        println(io, cte_env)

        # each table has the name of the former in scope
        cte_env = printpsql_commontable(io, table, cte_env)
        print(io, ")")
    end
    println(io, cte_env)
    printpsql(io, node.expression, cte_env)
end

function printpsql_commontable(io::IO, table::SubqueryTableItem, env)
    cte_nextenv = nextenv(env, table)
    alias = getalias(cte_nextenv, table.ref)
    print(io, "$alias AS (")
    ienv = indent(env)
    println(io, ienv)
    printpsql(io, table.query, ienv)
    cte_nextenv
end

function printpsql_commontable(io::IO, table::RecursiveCommonTable, env)
    print(io, "RECURSIVE ")
    cte_nextenv = printpsql_commontable(io, table.baseterm, env)
    print(io, " UNION ")
    table.unique || print(io, "ALL ")
    printpsql(io, table.iterateterm, cte_nextenv)
    cte_nextenv
end

function printpsql(io::IO, node::AggregateExpression, env)
    print(io, node.name)
    print(io, "(")
    if node.distinct
        print(io, " DISTINCT ")
    end
    ienv = indent(env)
    printpsql_fieldlist(io, node.operands, ienv; nofix="*")
    printpsql_fieldlist(io, node.order, indent(ienv); prefix=indentedline("ORDER BY ", ienv))
    print(io, ")")
    printpsql_filter(io, node.filter, ienv; prefix=indentedline("FILTER WHERE (", ienv), postfix=")")
end

function printpsql_parenthesized(io::IO, v, env)
    print(io, "(")
    printpsql(io, v, env)
    print(io, ")")
end

needs_parentheses(child::SQLNode, parent::SQLNode) = true
needs_parentheses(child::And, parent::Or) = false
needs_parentheses(child::TableItemFieldRef, parent::SQLNode) = false
needs_parentheses(child::SQLConstant, parent::SQLNode) = false
needs_parentheses(child::Cast, parent::SQLNode) = false
needs_parentheses(child::FunctionCall, parent::SQLNode) = false
needs_parentheses(child::AbstractAggregateExpression, parent::SQLNode) = false
needs_parentheses(child::Concat, parent::SQLNode) = false
needs_parentheses(child::SubqueryExpression, parent::SQLNode) = false
needs_parentheses(child, parent) = false

