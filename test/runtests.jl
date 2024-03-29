using Test: @testset, @test
using SQLCompose
using SQLCompose.Generate
using Chain
using Dates

include("./testsql.jl")
include("./data/bookings.jl")
include("./data/pagila.jl")

aircrafts = TableSource(:aircrafts, :aircraft_code => SQLCompose.CharType, :model => TextType, :range => SQLCompose.Int4Type; aliashint=:a)
flights = TableSource(:flights, :flight_id => Int4Type, :flight_no => SQLCompose.CharType,
    :scheduled_departure => SQLCompose.TimestampType, :scheduled_arrival => SQLCompose.TimestampType,
    :departure_airport => SQLCompose.CharType, :arrival_airport => SQLCompose.CharType, :status => SQLCompose.VarCharType,
    :aircraft_code => SQLCompose.CharType, :actual_departure => SQLCompose.TimestampType,
    :actual_arrival => SQLCompose.TimestampType; aliashint=:f)

@info "Running tests"

function runtests()
    @testset verbose = true "SQLCompose" begin
        @info VERSION
        include("./samples.jl")
        include("./queryset/runtests.jl")
        include("./generate/rowstructs.jl")
        include("./core/types.jl")
        include("./compose/general.jl")
        include("./compose/filter.jl")
        include("./compose/values.jl")
        include("./compose/map.jl")
        include("./compose/join.jl")
        include("./compose/combinedquery.jl")
        include("./compose/groupby.jl")
        include("./compose/sort.jl")
        include("./compose/operators.jl")
        include("./compose/cte.jl")
        include("./compose/reference.jl")
        include("./compose/aggregates.jl")
        include("./compose/srf.jl")
        include("./compose/update.jl")
    end
    return nothing
end
runtests()