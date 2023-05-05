@info "Running sort by tests"
@testset "sort by" begin
    @info "sort by asc"
    @testsql sort(t -> t.range, aircrafts) "SELECT a.aircraft_code, a.model, a.range FROM aircrafts a ORDER BY a.range"
    @info "sort by desc"
    @testsql sort(t -> desc(t.range), aircrafts) "SELECT a.aircraft_code, a.model, a.range FROM aircrafts a ORDER BY a.range DESC"
    @info "sort by multiple criteria"
    @testsql sort(t -> (desc(t.range), asc(t.aircraft_code)), aircrafts) "SELECT a.aircraft_code, a.model, a.range FROM aircrafts a ORDER BY a.range DESC, a.aircraft_code"
    @info "sort by fieldnames"
    @testsql sort(aircrafts, :range, :aircraft_code) "SELECT a.aircraft_code, a.model, a.range FROM aircrafts a ORDER BY a.range, a.aircraft_code"
end