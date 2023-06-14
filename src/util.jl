macro value(expr)
    value_name(name::Symbol) = name
    function value_name(name::Expr)
        if name.head == :(<:)
            return value_name(name.args[1])
        elseif name.head == :curly
            value_name(name.args[1])
        else
            error("should not occur")
        end
    end
    name = value_name(expr.args[2])
    body = expr.args[3].args


    value_fields(f::Symbol) = (f,)
    value_fields(f::LineNumberNode) = ()
    function value_fields(f::Expr)
        @assert f.head == :(::)
        (f.args[1],)
    end

    fields = reduce((acc, next) -> (acc..., value_fields(next)...), body; init=())

    kws = (Expr(:kw, esc(name), :(value.$name)) for name in fields)
    constructor = :($(esc(name))(value::$(esc(name)); $(kws...)) = $(esc(:($name($(fields...))))))
    setters = (:($(esc(Symbol("with_", fname)))(value::$(esc(name)), f) = $(esc(name))(value; $fname=f)) for fname in fields)
    quote
        $(esc(expr))
        $constructor
        $(setters...)
    end
end

