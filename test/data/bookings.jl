module Bookings
#= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:14 =#
#= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:15 =#
using SQLCompose
#= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:16 =#
begin
    #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:144 =#
    export AircraftsRow, Aircrafts_DataRow, AirportsRow, Airports_DataRow, Boarding_PassesRow, BookingsRow, FlightsRow, Flights_VRow, RoutesRow, SeatsRow, Ticket_FlightsRow, TicketsRow
    export ticket_flights_of, arrival_airport_of, departure_airport_of, aircrafts_data_of, aircrafts_data_of, flights_of, tickets_of, bookings_of
    export all_boarding_passes_of, all_arrival_airport_of, all_departure_airport_of, all_flights_of, all_seats_of, all_ticket_flights_of, all_ticket_flights_of, all_tickets_of
    export aircrafts_table, aircrafts_data_table, airports_table, airports_data_table, boarding_passes_table, bookings_table, flights_table, flights_v_table, routes_table, seats_table, ticket_flights_table, tickets_table
    export query_aircrafts, query_aircrafts_data, query_airports, query_airports_data, query_boarding_passes, query_bookings, query_flights, query_flights_v, query_routes, query_seats, query_ticket_flights, query_tickets
    #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:145 =#
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct AircraftsRow <: SQLCompose.RowStruct{RowType{:aircrafts, (:aircraft_code, :model, :range), Tuple{CharType, TextType, Int4Type}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            aircraft_code
            model
            range
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        aircrafts_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(AircraftsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(AircraftsRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{AircraftsRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{AircraftsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(AircraftsRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_aircrafts() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(AircraftsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_aircrafts(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(AircraftsRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::AircraftsRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.model, SQLCompose.nextalias(alias, :model), i)
                i = SQLCompose.foreachfield(f, result.range, SQLCompose.nextalias(alias, :range), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::AircraftsRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            AircraftsRow(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.model, SQLCompose.nextalias(alias, :model)), SQLCompose.mapfields(f, result.range, SQLCompose.nextalias(alias, :range)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::AircraftsRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.model, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.range, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Aircrafts_DataRow <: SQLCompose.RowStruct{RowType{:aircrafts_data, (:aircraft_code, :model, :range), Tuple{CharType, SQLCompose.JSONType, Int4Type}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            aircraft_code
            model
            range
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        aircrafts_data_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Aircrafts_DataRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Aircrafts_DataRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Aircrafts_DataRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Aircrafts_DataRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Aircrafts_DataRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_aircrafts_data() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Aircrafts_DataRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_aircrafts_data(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Aircrafts_DataRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Aircrafts_DataRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.model, SQLCompose.nextalias(alias, :model), i)
                i = SQLCompose.foreachfield(f, result.range, SQLCompose.nextalias(alias, :range), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Aircrafts_DataRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Aircrafts_DataRow(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.model, SQLCompose.nextalias(alias, :model)), SQLCompose.mapfields(f, result.range, SQLCompose.nextalias(alias, :range)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Aircrafts_DataRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.model, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.range, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct AirportsRow <: SQLCompose.RowStruct{RowType{:airports, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{CharType, TextType, TextType, SQLCompose.UnknownType, TextType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        airports_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(AirportsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(AirportsRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{AirportsRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{AirportsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(AirportsRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_airports() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(AirportsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_airports(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(AirportsRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::AirportsRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code), i)
                i = SQLCompose.foreachfield(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates), i)
                i = SQLCompose.foreachfield(f, result.timezone, SQLCompose.nextalias(alias, :timezone), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::AirportsRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            AirportsRow(SQLCompose.mapfields(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code)), SQLCompose.mapfields(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates)), SQLCompose.mapfields(f, result.timezone, SQLCompose.nextalias(alias, :timezone)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::AirportsRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.coordinates, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.timezone, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Airports_DataRow <: SQLCompose.RowStruct{RowType{:airports_data, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{CharType, SQLCompose.JSONType, SQLCompose.JSONType, SQLCompose.UnknownType, TextType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        airports_data_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Airports_DataRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Airports_DataRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Airports_DataRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Airports_DataRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Airports_DataRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_airports_data() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Airports_DataRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_airports_data(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Airports_DataRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Airports_DataRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code), i)
                i = SQLCompose.foreachfield(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates), i)
                i = SQLCompose.foreachfield(f, result.timezone, SQLCompose.nextalias(alias, :timezone), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Airports_DataRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Airports_DataRow(SQLCompose.mapfields(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code)), SQLCompose.mapfields(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates)), SQLCompose.mapfields(f, result.timezone, SQLCompose.nextalias(alias, :timezone)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Airports_DataRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.coordinates, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.timezone, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Boarding_PassesRow <: SQLCompose.RowStruct{RowType{:boarding_passes, (:ticket_no, :flight_id, :boarding_no, :seat_no), Tuple{CharType, Int4Type, Int4Type, SQLCompose.VarCharType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            ticket_no
            flight_id
            boarding_no
            seat_no
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        boarding_passes_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Boarding_PassesRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Boarding_PassesRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Boarding_PassesRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Boarding_PassesRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Boarding_PassesRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_boarding_passes() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Boarding_PassesRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_boarding_passes(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Boarding_PassesRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Boarding_PassesRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.boarding_no, SQLCompose.nextalias(alias, :boarding_no), i)
                i = SQLCompose.foreachfield(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Boarding_PassesRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Boarding_PassesRow(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.boarding_no, SQLCompose.nextalias(alias, :boarding_no)), SQLCompose.mapfields(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Boarding_PassesRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.ticket_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.boarding_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.seat_no, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct BookingsRow <: SQLCompose.RowStruct{RowType{:bookings, (:book_ref, :book_date, :total_amount), Tuple{CharType, SQLCompose.TimestampType, SQLCompose.DecimalType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            book_ref
            book_date
            total_amount
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        bookings_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(BookingsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(BookingsRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{BookingsRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{BookingsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(BookingsRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_bookings() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(BookingsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_bookings(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(BookingsRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::BookingsRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref), i)
                i = SQLCompose.foreachfield(f, result.book_date, SQLCompose.nextalias(alias, :book_date), i)
                i = SQLCompose.foreachfield(f, result.total_amount, SQLCompose.nextalias(alias, :total_amount), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::BookingsRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            BookingsRow(SQLCompose.mapfields(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref)), SQLCompose.mapfields(f, result.book_date, SQLCompose.nextalias(alias, :book_date)), SQLCompose.mapfields(f, result.total_amount, SQLCompose.nextalias(alias, :total_amount)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::BookingsRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.book_ref, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.book_date, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.total_amount, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct FlightsRow <: SQLCompose.RowStruct{RowType{:flights, (:flight_id, :flight_no, :scheduled_departure, :scheduled_arrival, :departure_airport, :arrival_airport, :status, :aircraft_code, :actual_departure, :actual_arrival), Tuple{Int4Type, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, CharType, CharType, SQLCompose.VarCharType, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            flight_id
            flight_no
            scheduled_departure
            scheduled_arrival
            departure_airport
            arrival_airport
            status
            aircraft_code
            actual_departure
            actual_arrival
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        flights_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(FlightsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(FlightsRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{FlightsRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{FlightsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(FlightsRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_flights() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(FlightsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_flights(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(FlightsRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::FlightsRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no), i)
                i = SQLCompose.foreachfield(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure), i)
                i = SQLCompose.foreachfield(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival), i)
                i = SQLCompose.foreachfield(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport), i)
                i = SQLCompose.foreachfield(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport), i)
                i = SQLCompose.foreachfield(f, result.status, SQLCompose.nextalias(alias, :status), i)
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure), i)
                i = SQLCompose.foreachfield(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::FlightsRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            FlightsRow(SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure)), SQLCompose.mapfields(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.status, SQLCompose.nextalias(alias, :status)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure)), SQLCompose.mapfields(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::FlightsRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.scheduled_departure, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.scheduled_arrival, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.departure_airport, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.arrival_airport, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.status, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.actual_departure, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.actual_arrival, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Flights_VRow <: SQLCompose.RowStruct{RowType{:flights_v, (:flight_id, :flight_no, :scheduled_departure, :scheduled_departure_local, :scheduled_arrival, :scheduled_arrival_local, :scheduled_duration, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :status, :aircraft_code, :actual_departure, :actual_departure_local, :actual_arrival, :actual_arrival_local, :actual_duration), Tuple{Int4Type, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType, CharType, TextType, TextType, CharType, TextType, TextType, SQLCompose.VarCharType, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            flight_id
            flight_no
            scheduled_departure
            scheduled_departure_local
            scheduled_arrival
            scheduled_arrival_local
            scheduled_duration
            departure_airport
            departure_airport_name
            departure_city
            arrival_airport
            arrival_airport_name
            arrival_city
            status
            aircraft_code
            actual_departure
            actual_departure_local
            actual_arrival
            actual_arrival_local
            actual_duration
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        flights_v_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Flights_VRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Flights_VRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Flights_VRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Flights_VRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Flights_VRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_flights_v() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Flights_VRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_flights_v(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Flights_VRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Flights_VRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no), i)
                i = SQLCompose.foreachfield(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure), i)
                i = SQLCompose.foreachfield(f, result.scheduled_departure_local, SQLCompose.nextalias(alias, :scheduled_departure_local), i)
                i = SQLCompose.foreachfield(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival), i)
                i = SQLCompose.foreachfield(f, result.scheduled_arrival_local, SQLCompose.nextalias(alias, :scheduled_arrival_local), i)
                i = SQLCompose.foreachfield(f, result.scheduled_duration, SQLCompose.nextalias(alias, :scheduled_duration), i)
                i = SQLCompose.foreachfield(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport), i)
                i = SQLCompose.foreachfield(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name), i)
                i = SQLCompose.foreachfield(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city), i)
                i = SQLCompose.foreachfield(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport), i)
                i = SQLCompose.foreachfield(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name), i)
                i = SQLCompose.foreachfield(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city), i)
                i = SQLCompose.foreachfield(f, result.status, SQLCompose.nextalias(alias, :status), i)
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure), i)
                i = SQLCompose.foreachfield(f, result.actual_departure_local, SQLCompose.nextalias(alias, :actual_departure_local), i)
                i = SQLCompose.foreachfield(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival), i)
                i = SQLCompose.foreachfield(f, result.actual_arrival_local, SQLCompose.nextalias(alias, :actual_arrival_local), i)
                i = SQLCompose.foreachfield(f, result.actual_duration, SQLCompose.nextalias(alias, :actual_duration), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Flights_VRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Flights_VRow(SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure)), SQLCompose.mapfields(f, result.scheduled_departure_local, SQLCompose.nextalias(alias, :scheduled_departure_local)), SQLCompose.mapfields(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival)), SQLCompose.mapfields(f, result.scheduled_arrival_local, SQLCompose.nextalias(alias, :scheduled_arrival_local)), SQLCompose.mapfields(f, result.scheduled_duration, SQLCompose.nextalias(alias, :scheduled_duration)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name)), SQLCompose.mapfields(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name)), SQLCompose.mapfields(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city)), SQLCompose.mapfields(f, result.status, SQLCompose.nextalias(alias, :status)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure)), SQLCompose.mapfields(f, result.actual_departure_local, SQLCompose.nextalias(alias, :actual_departure_local)), SQLCompose.mapfields(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival)), SQLCompose.mapfields(f, result.actual_arrival_local, SQLCompose.nextalias(alias, :actual_arrival_local)), SQLCompose.mapfields(f, result.actual_duration, SQLCompose.nextalias(alias, :actual_duration)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Flights_VRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.scheduled_departure, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.scheduled_departure_local, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.scheduled_arrival, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.scheduled_arrival_local, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.scheduled_duration, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.departure_airport, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.departure_airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.departure_city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.arrival_airport, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.arrival_airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.arrival_city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.status, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.actual_departure, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.actual_departure_local, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.actual_arrival, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.actual_arrival_local, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.actual_duration, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct RoutesRow <: SQLCompose.RowStruct{RowType{:routes, (:flight_no, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :aircraft_code, :duration, :days_of_week), Tuple{CharType, CharType, TextType, TextType, CharType, TextType, TextType, CharType, SQLCompose.IntervalType, SQLCompose.ArrayType{Int4Type}}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            flight_no
            departure_airport
            departure_airport_name
            departure_city
            arrival_airport
            arrival_airport_name
            arrival_city
            aircraft_code
            duration
            days_of_week
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        routes_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(RoutesRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(RoutesRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{RoutesRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{RoutesRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(RoutesRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_routes() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(RoutesRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_routes(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(RoutesRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::RoutesRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no), i)
                i = SQLCompose.foreachfield(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport), i)
                i = SQLCompose.foreachfield(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name), i)
                i = SQLCompose.foreachfield(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city), i)
                i = SQLCompose.foreachfield(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport), i)
                i = SQLCompose.foreachfield(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name), i)
                i = SQLCompose.foreachfield(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city), i)
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.duration, SQLCompose.nextalias(alias, :duration), i)
                i = SQLCompose.foreachfield(f, result.days_of_week, SQLCompose.nextalias(alias, :days_of_week), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::RoutesRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            RoutesRow(SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name)), SQLCompose.mapfields(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name)), SQLCompose.mapfields(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.duration, SQLCompose.nextalias(alias, :duration)), SQLCompose.mapfields(f, result.days_of_week, SQLCompose.nextalias(alias, :days_of_week)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::RoutesRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.departure_airport, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.departure_airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.departure_city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.arrival_airport, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.arrival_airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.arrival_city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.duration, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.days_of_week, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct SeatsRow <: SQLCompose.RowStruct{RowType{:seats, (:aircraft_code, :seat_no, :fare_conditions), Tuple{CharType, SQLCompose.VarCharType, SQLCompose.VarCharType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            aircraft_code
            seat_no
            fare_conditions
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        seats_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(SeatsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(SeatsRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{SeatsRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{SeatsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(SeatsRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_seats() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(SeatsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_seats(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(SeatsRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::SeatsRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no), i)
                i = SQLCompose.foreachfield(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::SeatsRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            SeatsRow(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no)), SQLCompose.mapfields(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::SeatsRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.seat_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.fare_conditions, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Ticket_FlightsRow <: SQLCompose.RowStruct{RowType{:ticket_flights, (:ticket_no, :flight_id, :fare_conditions, :amount), Tuple{CharType, Int4Type, SQLCompose.VarCharType, SQLCompose.DecimalType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            ticket_no
            flight_id
            fare_conditions
            amount
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        ticket_flights_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Ticket_FlightsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Ticket_FlightsRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Ticket_FlightsRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Ticket_FlightsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Ticket_FlightsRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_ticket_flights() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Ticket_FlightsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_ticket_flights(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Ticket_FlightsRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Ticket_FlightsRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions), i)
                i = SQLCompose.foreachfield(f, result.amount, SQLCompose.nextalias(alias, :amount), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Ticket_FlightsRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Ticket_FlightsRow(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions)), SQLCompose.mapfields(f, result.amount, SQLCompose.nextalias(alias, :amount)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Ticket_FlightsRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.ticket_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.fare_conditions, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.amount, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct TicketsRow <: SQLCompose.RowStruct{RowType{:tickets, (:ticket_no, :book_ref, :passenger_id, :passenger_name, :contact_data), Tuple{CharType, CharType, SQLCompose.VarCharType, TextType, SQLCompose.JSONType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            ticket_no
            book_ref
            passenger_id
            passenger_name
            contact_data
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        tickets_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(TicketsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(TicketsRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{TicketsRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{TicketsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(TicketsRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_tickets() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(TicketsRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_tickets(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(TicketsRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::TicketsRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref), i)
                i = SQLCompose.foreachfield(f, result.passenger_id, SQLCompose.nextalias(alias, :passenger_id), i)
                i = SQLCompose.foreachfield(f, result.passenger_name, SQLCompose.nextalias(alias, :passenger_name), i)
                i = SQLCompose.foreachfield(f, result.contact_data, SQLCompose.nextalias(alias, :contact_data), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::TicketsRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            TicketsRow(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref)), SQLCompose.mapfields(f, result.passenger_id, SQLCompose.nextalias(alias, :passenger_id)), SQLCompose.mapfields(f, result.passenger_name, SQLCompose.nextalias(alias, :passenger_name)), SQLCompose.mapfields(f, result.contact_data, SQLCompose.nextalias(alias, :contact_data)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::TicketsRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.ticket_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.book_ref, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.passenger_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.passenger_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.contact_data, tableitem)
        end
    end
    #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:146 =#
    ticket_flights_of(boarding_passes::Boarding_PassesRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(Ticket_FlightsRow, (:ticket_no, :flight_id), (boarding_passes.ticket_no, boarding_passes.flight_id))
        end
    arrival_airport_of(flights::FlightsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(Airports_DataRow, (:airport_code,), (flights.arrival_airport,))
        end
    departure_airport_of(flights::FlightsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(Airports_DataRow, (:airport_code,), (flights.departure_airport,))
        end
    aircrafts_data_of(flights::FlightsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(Aircrafts_DataRow, (:aircraft_code,), (flights.aircraft_code,))
        end
    aircrafts_data_of(seats::SeatsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(Aircrafts_DataRow, (:aircraft_code,), (seats.aircraft_code,))
        end
    flights_of(ticket_flights::Ticket_FlightsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(FlightsRow, (:flight_id,), (ticket_flights.flight_id,))
        end
    tickets_of(ticket_flights::Ticket_FlightsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(TicketsRow, (:ticket_no,), (ticket_flights.ticket_no,))
        end
    bookings_of(tickets::TicketsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(BookingsRow, (:book_ref,), (tickets.book_ref,))
        end
    #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:147 =#
    all_boarding_passes_of(ticket_flights::Ticket_FlightsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Boarding_PassesRow, (:ticket_no, :flight_id), (ticket_flights.ticket_no, ticket_flights.flight_id))
        end
    all_arrival_airport_of(airports_data::Airports_DataRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(FlightsRow, (:arrival_airport,), (airports_data.airport_code,))
        end
    all_departure_airport_of(airports_data::Airports_DataRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(FlightsRow, (:departure_airport,), (airports_data.airport_code,))
        end
    all_flights_of(aircrafts_data::Aircrafts_DataRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(FlightsRow, (:aircraft_code,), (aircrafts_data.aircraft_code,))
        end
    all_seats_of(aircrafts_data::Aircrafts_DataRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(SeatsRow, (:aircraft_code,), (aircrafts_data.aircraft_code,))
        end
    all_ticket_flights_of(flights::FlightsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Ticket_FlightsRow, (:flight_id,), (flights.flight_id,))
        end
    all_ticket_flights_of(tickets::TicketsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Ticket_FlightsRow, (:ticket_no,), (tickets.ticket_no,))
        end
    all_tickets_of(bookings::BookingsRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(TicketsRow, (:book_ref,), (bookings.book_ref,))
        end
end
end