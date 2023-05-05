using SQLCompose.Generate

function generate_databases()
    root = dirname(@__FILE__)
    path = root
    generate(joinpath(path, "pagila.jl"), "postgresql://postgres:postgres@localhost:5432/pagila"; modulename=:Pagila)
    generate(joinpath(path, "bookings.jl"), "postgresql://postgres:postgres@localhost:5432/demo"; modulename=:Bookings, schema="bookings")
end

generate_databases()
