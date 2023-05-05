

function testsql(left, right) 
    quote
        @test normalize(string($(esc(left)))) == normalize(string($(esc(right)))) 
    end
end

macro testsql(left, right)
    testsql(left, right)
end

macro testsql(expr)
    @assert expr.head == :block || expr.head == :tuple
    left, right = filter(x -> !(x isa LineNumberNode), expr.args)
    testsql(left, right)
end

function normalize(s::String)
    normalized = replace(strip(s), "\t" => " ", "\n" => " ", "  " => " ")
    normalized != s ? normalize(normalized) : normalized
end