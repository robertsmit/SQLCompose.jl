module Bookings
#= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:15 =#
#= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:16 =#
using SQLCompose
#= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:17 =#
begin
    #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:132 =#
    export AircraftsRow, Aircrafts_DataRow, AirportsRow, Airports_DataRow, Boarding_PassesRow, BookingsRow, FlightsRow, Flights_VRow, RoutesRow, SeatsRow, Ticket_FlightsRow, TicketsRow
    export ticket_flights_of, arrival_airport_of, departure_airport_of, aircrafts_data_of, aircrafts_data_of, flights_of, tickets_of, bookings_of
    export aircrafts_table, aircrafts_data_table, airports_table, airports_data_table, boarding_passes_table, bookings_table, flights_table, flights_v_table, routes_table, seats_table, ticket_flights_table, tickets_table
    export query_aircrafts, query_aircrafts_data, query_airports, query_airports_data, query_boarding_passes, query_bookings, query_flights, query_flights_v, query_routes, query_seats, query_ticket_flights, query_tickets
    #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:133 =#
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct AircraftsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:aircrafts, (:aircraft_code, :model, :range), Tuple{SQLCompose.CharType, TextType, Int4Type}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            aircraft_code
            model
            range
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        aircrafts_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(AircraftsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(AircraftsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{AircraftsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{AircraftsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(AircraftsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_aircrafts() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(AircraftsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_aircrafts(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(AircraftsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::AircraftsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.model, SQLCompose.nextalias(alias, :model), i)
                i = SQLCompose.foreachfield(f, result.range, SQLCompose.nextalias(alias, :range), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::AircraftsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            AircraftsRow(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.model, SQLCompose.nextalias(alias, :model)), SQLCompose.mapfields(f, result.range, SQLCompose.nextalias(alias, :range)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::AircraftsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.aircraft_code, tableitem)
            SQLCompose.writelateralplan!(plan, node.model, tableitem)
            SQLCompose.writelateralplan!(plan, node.range, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Aircrafts_DataRow <: SQLCompose.RowStruct{SQLCompose.RowType{:aircrafts_data, (:aircraft_code, :model, :range), Tuple{SQLCompose.CharType, SQLCompose.JSONType, Int4Type}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            aircraft_code
            model
            range
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        aircrafts_data_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Aircrafts_DataRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Aircrafts_DataRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Aircrafts_DataRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Aircrafts_DataRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Aircrafts_DataRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_aircrafts_data() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Aircrafts_DataRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_aircrafts_data(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Aircrafts_DataRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Aircrafts_DataRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.model, SQLCompose.nextalias(alias, :model), i)
                i = SQLCompose.foreachfield(f, result.range, SQLCompose.nextalias(alias, :range), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Aircrafts_DataRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Aircrafts_DataRow(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.model, SQLCompose.nextalias(alias, :model)), SQLCompose.mapfields(f, result.range, SQLCompose.nextalias(alias, :range)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Aircrafts_DataRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.aircraft_code, tableitem)
            SQLCompose.writelateralplan!(plan, node.model, tableitem)
            SQLCompose.writelateralplan!(plan, node.range, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct AirportsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:airports, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{SQLCompose.CharType, TextType, TextType, SQLCompose.UnknownType, TextType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        airports_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(AirportsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(AirportsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{AirportsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{AirportsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(AirportsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_airports() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(AirportsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_airports(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(AirportsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::AirportsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code), i)
                i = SQLCompose.foreachfield(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates), i)
                i = SQLCompose.foreachfield(f, result.timezone, SQLCompose.nextalias(alias, :timezone), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::AirportsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            AirportsRow(SQLCompose.mapfields(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code)), SQLCompose.mapfields(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates)), SQLCompose.mapfields(f, result.timezone, SQLCompose.nextalias(alias, :timezone)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::AirportsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.airport_code, tableitem)
            SQLCompose.writelateralplan!(plan, node.airport_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.city, tableitem)
            SQLCompose.writelateralplan!(plan, node.coordinates, tableitem)
            SQLCompose.writelateralplan!(plan, node.timezone, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Airports_DataRow <: SQLCompose.RowStruct{SQLCompose.RowType{:airports_data, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{SQLCompose.CharType, SQLCompose.JSONType, SQLCompose.JSONType, SQLCompose.UnknownType, TextType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        airports_data_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Airports_DataRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Airports_DataRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Airports_DataRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Airports_DataRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Airports_DataRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_airports_data() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Airports_DataRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_airports_data(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Airports_DataRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Airports_DataRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code), i)
                i = SQLCompose.foreachfield(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates), i)
                i = SQLCompose.foreachfield(f, result.timezone, SQLCompose.nextalias(alias, :timezone), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Airports_DataRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Airports_DataRow(SQLCompose.mapfields(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code)), SQLCompose.mapfields(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates)), SQLCompose.mapfields(f, result.timezone, SQLCompose.nextalias(alias, :timezone)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Airports_DataRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.airport_code, tableitem)
            SQLCompose.writelateralplan!(plan, node.airport_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.city, tableitem)
            SQLCompose.writelateralplan!(plan, node.coordinates, tableitem)
            SQLCompose.writelateralplan!(plan, node.timezone, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Boarding_PassesRow <: SQLCompose.RowStruct{SQLCompose.RowType{:boarding_passes, (:ticket_no, :flight_id, :boarding_no, :seat_no), Tuple{SQLCompose.CharType, Int4Type, Int4Type, SQLCompose.VarCharType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            ticket_no
            flight_id
            boarding_no
            seat_no
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        boarding_passes_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Boarding_PassesRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Boarding_PassesRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Boarding_PassesRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Boarding_PassesRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Boarding_PassesRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_boarding_passes() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Boarding_PassesRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_boarding_passes(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Boarding_PassesRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Boarding_PassesRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.boarding_no, SQLCompose.nextalias(alias, :boarding_no), i)
                i = SQLCompose.foreachfield(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Boarding_PassesRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Boarding_PassesRow(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.boarding_no, SQLCompose.nextalias(alias, :boarding_no)), SQLCompose.mapfields(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Boarding_PassesRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.ticket_no, tableitem)
            SQLCompose.writelateralplan!(plan, node.flight_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.boarding_no, tableitem)
            SQLCompose.writelateralplan!(plan, node.seat_no, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct BookingsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:bookings, (:book_ref, :book_date, :total_amount), Tuple{SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            book_ref
            book_date
            total_amount
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        bookings_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(BookingsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(BookingsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{BookingsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{BookingsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(BookingsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_bookings() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(BookingsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_bookings(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(BookingsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::BookingsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref), i)
                i = SQLCompose.foreachfield(f, result.book_date, SQLCompose.nextalias(alias, :book_date), i)
                i = SQLCompose.foreachfield(f, result.total_amount, SQLCompose.nextalias(alias, :total_amount), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::BookingsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            BookingsRow(SQLCompose.mapfields(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref)), SQLCompose.mapfields(f, result.book_date, SQLCompose.nextalias(alias, :book_date)), SQLCompose.mapfields(f, result.total_amount, SQLCompose.nextalias(alias, :total_amount)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::BookingsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.book_ref, tableitem)
            SQLCompose.writelateralplan!(plan, node.book_date, tableitem)
            SQLCompose.writelateralplan!(plan, node.total_amount, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct FlightsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:flights, (:flight_id, :flight_no, :scheduled_departure, :scheduled_arrival, :departure_airport, :arrival_airport, :status, :aircraft_code, :actual_departure, :actual_arrival), Tuple{Int4Type, SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.CharType, SQLCompose.CharType, SQLCompose.VarCharType, SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        flights_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(FlightsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(FlightsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{FlightsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{FlightsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(FlightsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_flights() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(FlightsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_flights(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(FlightsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::FlightsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::FlightsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            FlightsRow(SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure)), SQLCompose.mapfields(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.status, SQLCompose.nextalias(alias, :status)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure)), SQLCompose.mapfields(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::FlightsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.flight_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.flight_no, tableitem)
            SQLCompose.writelateralplan!(plan, node.scheduled_departure, tableitem)
            SQLCompose.writelateralplan!(plan, node.scheduled_arrival, tableitem)
            SQLCompose.writelateralplan!(plan, node.departure_airport, tableitem)
            SQLCompose.writelateralplan!(plan, node.arrival_airport, tableitem)
            SQLCompose.writelateralplan!(plan, node.status, tableitem)
            SQLCompose.writelateralplan!(plan, node.aircraft_code, tableitem)
            SQLCompose.writelateralplan!(plan, node.actual_departure, tableitem)
            SQLCompose.writelateralplan!(plan, node.actual_arrival, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Flights_VRow <: SQLCompose.RowStruct{SQLCompose.RowType{:flights_v, (:flight_id, :flight_no, :scheduled_departure, :scheduled_departure_local, :scheduled_arrival, :scheduled_arrival_local, :scheduled_duration, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :status, :aircraft_code, :actual_departure, :actual_departure_local, :actual_arrival, :actual_arrival_local, :actual_duration), Tuple{Int4Type, SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType, SQLCompose.CharType, TextType, TextType, SQLCompose.CharType, TextType, TextType, SQLCompose.VarCharType, SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        flights_v_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Flights_VRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Flights_VRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Flights_VRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Flights_VRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Flights_VRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_flights_v() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Flights_VRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_flights_v(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Flights_VRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Flights_VRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Flights_VRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Flights_VRow(SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure)), SQLCompose.mapfields(f, result.scheduled_departure_local, SQLCompose.nextalias(alias, :scheduled_departure_local)), SQLCompose.mapfields(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival)), SQLCompose.mapfields(f, result.scheduled_arrival_local, SQLCompose.nextalias(alias, :scheduled_arrival_local)), SQLCompose.mapfields(f, result.scheduled_duration, SQLCompose.nextalias(alias, :scheduled_duration)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name)), SQLCompose.mapfields(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name)), SQLCompose.mapfields(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city)), SQLCompose.mapfields(f, result.status, SQLCompose.nextalias(alias, :status)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure)), SQLCompose.mapfields(f, result.actual_departure_local, SQLCompose.nextalias(alias, :actual_departure_local)), SQLCompose.mapfields(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival)), SQLCompose.mapfields(f, result.actual_arrival_local, SQLCompose.nextalias(alias, :actual_arrival_local)), SQLCompose.mapfields(f, result.actual_duration, SQLCompose.nextalias(alias, :actual_duration)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Flights_VRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.flight_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.flight_no, tableitem)
            SQLCompose.writelateralplan!(plan, node.scheduled_departure, tableitem)
            SQLCompose.writelateralplan!(plan, node.scheduled_departure_local, tableitem)
            SQLCompose.writelateralplan!(plan, node.scheduled_arrival, tableitem)
            SQLCompose.writelateralplan!(plan, node.scheduled_arrival_local, tableitem)
            SQLCompose.writelateralplan!(plan, node.scheduled_duration, tableitem)
            SQLCompose.writelateralplan!(plan, node.departure_airport, tableitem)
            SQLCompose.writelateralplan!(plan, node.departure_airport_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.departure_city, tableitem)
            SQLCompose.writelateralplan!(plan, node.arrival_airport, tableitem)
            SQLCompose.writelateralplan!(plan, node.arrival_airport_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.arrival_city, tableitem)
            SQLCompose.writelateralplan!(plan, node.status, tableitem)
            SQLCompose.writelateralplan!(plan, node.aircraft_code, tableitem)
            SQLCompose.writelateralplan!(plan, node.actual_departure, tableitem)
            SQLCompose.writelateralplan!(plan, node.actual_departure_local, tableitem)
            SQLCompose.writelateralplan!(plan, node.actual_arrival, tableitem)
            SQLCompose.writelateralplan!(plan, node.actual_arrival_local, tableitem)
            SQLCompose.writelateralplan!(plan, node.actual_duration, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct RoutesRow <: SQLCompose.RowStruct{SQLCompose.RowType{:routes, (:flight_no, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :aircraft_code, :duration, :days_of_week), Tuple{SQLCompose.CharType, SQLCompose.CharType, TextType, TextType, SQLCompose.CharType, TextType, TextType, SQLCompose.CharType, SQLCompose.IntervalType, SQLCompose.ArrayType{Int4Type}}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        routes_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(RoutesRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(RoutesRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{RoutesRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{RoutesRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(RoutesRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_routes() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(RoutesRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_routes(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(RoutesRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::RoutesRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::RoutesRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            RoutesRow(SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name)), SQLCompose.mapfields(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name)), SQLCompose.mapfields(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.duration, SQLCompose.nextalias(alias, :duration)), SQLCompose.mapfields(f, result.days_of_week, SQLCompose.nextalias(alias, :days_of_week)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::RoutesRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.flight_no, tableitem)
            SQLCompose.writelateralplan!(plan, node.departure_airport, tableitem)
            SQLCompose.writelateralplan!(plan, node.departure_airport_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.departure_city, tableitem)
            SQLCompose.writelateralplan!(plan, node.arrival_airport, tableitem)
            SQLCompose.writelateralplan!(plan, node.arrival_airport_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.arrival_city, tableitem)
            SQLCompose.writelateralplan!(plan, node.aircraft_code, tableitem)
            SQLCompose.writelateralplan!(plan, node.duration, tableitem)
            SQLCompose.writelateralplan!(plan, node.days_of_week, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct SeatsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:seats, (:aircraft_code, :seat_no, :fare_conditions), Tuple{SQLCompose.CharType, SQLCompose.VarCharType, SQLCompose.VarCharType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            aircraft_code
            seat_no
            fare_conditions
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        seats_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(SeatsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(SeatsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{SeatsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{SeatsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(SeatsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_seats() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(SeatsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_seats(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(SeatsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::SeatsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no), i)
                i = SQLCompose.foreachfield(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::SeatsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            SeatsRow(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no)), SQLCompose.mapfields(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::SeatsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.aircraft_code, tableitem)
            SQLCompose.writelateralplan!(plan, node.seat_no, tableitem)
            SQLCompose.writelateralplan!(plan, node.fare_conditions, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Ticket_FlightsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:ticket_flights, (:ticket_no, :flight_id, :fare_conditions, :amount), Tuple{SQLCompose.CharType, Int4Type, SQLCompose.VarCharType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            ticket_no
            flight_id
            fare_conditions
            amount
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        ticket_flights_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Ticket_FlightsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Ticket_FlightsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Ticket_FlightsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Ticket_FlightsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Ticket_FlightsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_ticket_flights() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Ticket_FlightsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_ticket_flights(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Ticket_FlightsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Ticket_FlightsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions), i)
                i = SQLCompose.foreachfield(f, result.amount, SQLCompose.nextalias(alias, :amount), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Ticket_FlightsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Ticket_FlightsRow(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions)), SQLCompose.mapfields(f, result.amount, SQLCompose.nextalias(alias, :amount)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Ticket_FlightsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.ticket_no, tableitem)
            SQLCompose.writelateralplan!(plan, node.flight_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.fare_conditions, tableitem)
            SQLCompose.writelateralplan!(plan, node.amount, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct TicketsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:tickets, (:ticket_no, :book_ref, :passenger_id, :passenger_name, :contact_data), Tuple{SQLCompose.CharType, SQLCompose.CharType, SQLCompose.VarCharType, TextType, SQLCompose.JSONType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            ticket_no
            book_ref
            passenger_id
            passenger_name
            contact_data
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        tickets_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(TicketsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(TicketsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{TicketsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{TicketsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(TicketsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_tickets() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(TicketsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_tickets(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(TicketsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::TicketsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref), i)
                i = SQLCompose.foreachfield(f, result.passenger_id, SQLCompose.nextalias(alias, :passenger_id), i)
                i = SQLCompose.foreachfield(f, result.passenger_name, SQLCompose.nextalias(alias, :passenger_name), i)
                i = SQLCompose.foreachfield(f, result.contact_data, SQLCompose.nextalias(alias, :contact_data), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::TicketsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            TicketsRow(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref)), SQLCompose.mapfields(f, result.passenger_id, SQLCompose.nextalias(alias, :passenger_id)), SQLCompose.mapfields(f, result.passenger_name, SQLCompose.nextalias(alias, :passenger_name)), SQLCompose.mapfields(f, result.contact_data, SQLCompose.nextalias(alias, :contact_data)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::TicketsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.ticket_no, tableitem)
            SQLCompose.writelateralplan!(plan, node.book_ref, tableitem)
            SQLCompose.writelateralplan!(plan, node.passenger_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.passenger_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.contact_data, tableitem)
        end
    end
    #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:134 =#
    ticket_flights_of(boarding_passes::Boarding_PassesRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(Ticket_FlightsRow, (:ticket_no, :flight_id), (boarding_passes.ticket_no, boarding_passes.flight_id))
        end
    arrival_airport_of(flights::FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(Airports_DataRow, (:airport_code,), (flights.arrival_airport,))
        end
    departure_airport_of(flights::FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(Airports_DataRow, (:airport_code,), (flights.departure_airport,))
        end
    aircrafts_data_of(flights::FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(Aircrafts_DataRow, (:aircraft_code,), (flights.aircraft_code,))
        end
    aircrafts_data_of(seats::SeatsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(Aircrafts_DataRow, (:aircraft_code,), (seats.aircraft_code,))
        end
    flights_of(ticket_flights::Ticket_FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(FlightsRow, (:flight_id,), (ticket_flights.flight_id,))
        end
    tickets_of(ticket_flights::Ticket_FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(TicketsRow, (:ticket_no,), (ticket_flights.ticket_no,))
        end
    bookings_of(tickets::TicketsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(BookingsRow, (:book_ref,), (tickets.book_ref,))
        end
end
end