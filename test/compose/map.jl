@info "Running map tests"
@testset "map" begin
    @testset "basic map" begin
        @info "unmapped"
        @testsql query(aircrafts) "SELECT a.aircraft_code, a.model, a.range FROM aircrafts a"

        @info "single"
        @testsql map(aircrafts, :aircraft_code) "SELECT a.aircraft_code FROM aircrafts a"

        @info "multiple"
        @testsql map(aircrafts, :aircraft_code, :model) "SELECT a.aircraft_code, a.model FROM aircrafts a"

        @info "tuple"
        @testsql map(f -> (f.aircraft_code, f.model), aircrafts),
        "SELECT a.aircraft_code AS elem1, a.model AS elem2 FROM aircrafts a"

        @info "nested tuple"
        @testsql map(f -> ((f.aircraft_code, f.model), f.range), aircrafts),
        "SELECT a.aircraft_code AS elem1_1, a.model AS elem1_2, a.range AS elem2 FROM aircrafts a"

        @info "array"
        @testsql map(f -> [f.first_name, f.last_name], Pagila.Actor),
        "SELECT ARRAY[a.first_name, a.last_name] AS elem1 FROM actor a"

        @info "alias: keyargs"
        @testsql map(aircrafts; code=:aircraft_code, rng=:range),
        "SELECT a.aircraft_code AS code, a.range AS rng FROM aircrafts a"

        @info "alias: namedtuple"
        @testsql map(f -> (f.aircraft_code, rng=f.range), aircrafts),
        "SELECT a.aircraft_code, a.range AS rng FROM aircrafts a"
    end

    @testset "map advanced" begin
        @info "subquery"
        @testsql (@chain query(aircrafts) begin
            map(_, :aircraft_code)
            query(_)
            map(_, :aircraft_code)
        end),
        "SELECT q.aircraft_code FROM (SELECT a.aircraft_code FROM aircrafts a) q"

        @info "join"
        @testsql map(join(aircrafts, flights, :aircraft_code)) do a, f
            (a.aircraft_code, f.flight_no)
        end,
        "SELECT a.aircraft_code AS elem1, f.flight_no AS elem2 FROM aircrafts a INNER JOIN flights f ON a.aircraft_code = f.aircraft_code"

        @info "nested array"
        @testsql (
            map(flights) do f
                [[f.scheduled_arrival, f.actual_arrival], [f.scheduled_departure, f.actual_departure]]
            end
        ) "SELECT ARRAY[ARRAY[f.scheduled_arrival, f.actual_arrival],
                ARRAY[f.scheduled_departure, f.actual_departure]] AS elem1 
            FROM flights f"

        @info "test map deep nested tuple"
        @testsql (
            map(flights) do f
                (f.flight_id, (f.flight_id, f.flight_id, (f.flight_id, f.flight_id, f.flight_id, (f.flight_id, f.flight_id, f.flight_id, f.flight_id))))
            end
        ) "SELECT f.flight_id AS elem1, 
                    f.flight_id AS elem2_1, f.flight_id AS elem2_2, 
                        f.flight_id AS elem2_3_1, f.flight_id AS elem2_3_2, f.flight_id AS elem2_3_3, 
                            f.flight_id AS elem2_3_4_1, f.flight_id AS elem2_3_4_2, f.flight_id AS elem2_3_4_3, f.flight_id AS elem2_3_4_4 FROM flights f"

        @info "test map nested named tuple"
        @testsql (
            map(flights) do f
                (a=(f.flight_id, (f.flight_id, (b=f.flight_id, c=f.flight_id, c2=(f.flight_id,)))), b=f.flight_id, c=f.flight_id)
            end
        ), "SELECT f.flight_id AS a_1, f.flight_id AS a_2_1, f.flight_id AS a_2_2_b, f.flight_id AS a_2_2_c, f.flight_id AS a_2_2_c2_1, f.flight_id AS b, f.flight_id AS c FROM flights f"
    end

    @info "map subquery"
    @testsql map(t -> query(1), flights) "SELECT (SELECT 1 AS elem1) AS elem1 FROM flights f"


    @info "map from tuple subquery"
    let subq = query(map(f -> ((f.flight_id,), (a=f.aircraft_code,),), flights))
        @testsql map(t -> (t[1][1], t[2].a), subq),
        "SELECT q.elem1_1 AS elem1, q.elem2_a AS elem2 FROM (SELECT f.flight_id AS elem1_1, f.aircraft_code AS elem2_a FROM flights f) q"
    end

    @info "map name conflicts"
    @testsql (@query Pagila.Actor begin
       map(_) do a
       (a.last_name, (last_name=a.last_name,))
       end
       end), "SELECT a.last_name AS elem1, a.last_name AS elem2_last_name FROM actor a"

end