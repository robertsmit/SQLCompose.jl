macro eager(expr)
    rewrite_short_circuit(expr) |> esc
end

macro query(args...)
    base, rest... = map(args) do arg
        rewrite_for_query(__module__, arg)
    end
    esc(:(Chain.@chain convert(SQLCompose.Query, $base) $(rest...)))
end

rewrite_for_query(m::Module, expr) = expr
function rewrite_for_query(m::Module, expr::Expr)
    newargs = (rewrite_for_query(m, arg) for arg in expr.args)
    if expr.head == :macrocall && expr.args[1] == Symbol("@query")
        return macroexpand(m, Expr(expr.head, newargs...))
    end
    newargs = (rewrite_short_circuit(arg) for arg in newargs)
    return Expr(expr.head, newargs...)
end

rewrite_short_circuit(expr::Any) = expr

function rewrite_short_circuit(expr::Expr)
    newargs = (rewrite_short_circuit(arg) for arg in expr.args)
    if expr.head in [:if, :elseif]
        Expr(:call, :(SQLCompose.case), newargs...)
    elseif expr.head == :&&
        Expr(:call, :&, newargs...)
    elseif expr.head == :||
        Expr(:call, :|, newargs...)
    else
        Expr(expr.head, newargs...)
    end
end