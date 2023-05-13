using SQLCompose.Generate

function generate_databases()
    root = dirname(@__FILE__)
    path = root
    generate(joinpath(path, "pagila.jl"), "postgresql://postgres:postgres@localhost:5432/pagila"; modulename=:Pagila)
    generate(joinpath(path, "bookings.jl"), "postgresql://postgres:postgres@localhost:5432/demo"; modulename=:Bookings, schema="bookings", typename=
    tablename -> let
        tablename = string(tablename)
        truncated =
            endswith(tablename, "sses") ? tablename[1:end-2] :
            endswith(tablename, "s") ? tablename[1:end-1] :        
            tablename
        Symbol(truncated |> string |> titlecase)
    end
    )
end

generate_databases()
