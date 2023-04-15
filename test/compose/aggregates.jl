#Bigger aircraft have more seats of various travel classes:
@testsql begin
    basequery = Bookings.query_seats() |>
                groupby(:aircraft_code, :fare_conditions) |>
                sort(:aircraft_code, :fare_conditions) |>
                map(s -> (; s.aircraft_code, s.fare_conditions, num=count()))
    basequery
end,
"SELECT s.aircraft_code, s.fare_conditions, count(*) AS num FROM seats s 
    GROUP BY s.aircraft_code, s.fare_conditions 
    ORDER BY s.aircraft_code, s.fare_conditions"


    @testsql begin
        basequery = Bookings.query_seats() |>
                    groupby(:aircraft_code, :fare_conditions) |>
                    sort(:aircraft_code, :fare_conditions) |>
                    map(s -> (; s.aircraft_code, s.fare_conditions, num_bussiness=count(s.aircraft_code; filter=s.fare_conditions == "Business")))
        basequery
    end,
    "SELECT s.aircraft_code, s.fare_conditions, 
        count(s.aircraft_code) FILTER WHERE(s.fare_conditions = 'Business') AS num_bussiness FROM seats s 
        GROUP BY s.aircraft_code, s.fare_conditions 
        ORDER BY s.aircraft_code, s.fare_conditions"