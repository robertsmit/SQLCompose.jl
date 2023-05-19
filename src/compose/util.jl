macro eager(expr)
	non_short_circuit(expr) |> esc
end

macro query(base, next)
	esc(:(@Chain.chain convert(SQLCompose.Query, $base) $(non_short_circuit(next))))
end

non_short_circuit(expr::Any) = expr

function non_short_circuit(expr::Expr)
	nsc_args = map(e -> e |> non_short_circuit, expr.args)
	if expr.head in [:if, :elseif]
		Expr(:call, :(SQLCompose.case), nsc_args...)
	elseif expr.head == :&&
		Expr(:call, :&, nsc_args...)
	elseif expr.head == :||
		Expr(:call, :|, nsc_args...)
	else
		Expr(expr.head, nsc_args...)
	end
end