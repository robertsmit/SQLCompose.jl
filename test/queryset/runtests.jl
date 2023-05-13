include("executor.jl")


@info "Running queryset tests"
@testset "queryset" begin
        executor = MockQueryExecutor([("code1", "model1", 10), ("code2", "model2", 20)])
        aircrafts = query(Bookings.Aircraft, executor)
        @testsql aircrafts "SELECT a.aircraft_code, a.model, a.range FROM aircrafts a"
        result = collect(aircrafts)
        @assert typeof(result[1]) == Bookings.Aircraft      
        @assert NamedTuple(result[1]) == (aircraft_code="code1", model="model1", range=10)

        aircrafts = map(aircrafts) do each
            (code=each.aircraft_code, props=(each.model, each.range))
        end
        @testsql aircrafts "SELECT a.aircraft_code AS code, a.model AS props_1, a.range AS props_2 FROM aircrafts a"
        result = collect(aircrafts)
        @assert result[1] == (code="code1", props=("model1", 10))
        @assert result[2] == (code="code2", props=("model2", 20))
        
    

        
end

