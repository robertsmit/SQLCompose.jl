module Bookings
#= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:14 =#
#= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:15 =#
using SQLCompose
#= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:16 =#
begin
    #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:131 =#
    export AircraftsRow, Aircrafts_DataRow, AirportsRow, Airports_DataRow, Boarding_PassesRow, BookingsRow, FlightsRow, Flights_VRow, RoutesRow, SeatsRow, Ticket_FlightsRow, TicketsRow
    export ticket_flights_of, arrival_airport_of, departure_airport_of, aircrafts_data_of, aircrafts_data_of, flights_of, tickets_of, bookings_of
    export aircrafts_table, aircrafts_data_table, airports_table, airports_data_table, boarding_passes_table, bookings_table, flights_table, flights_v_table, routes_table, seats_table, ticket_flights_table, tickets_table
    export query_aircrafts, query_aircrafts_data, query_airports, query_airports_data, query_boarding_passes, query_bookings, query_flights, query_flights_v, query_routes, query_seats, query_ticket_flights, query_tickets
    #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:132 =#
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct AircraftsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:aircrafts, (:aircraft_code, :model, :range), Tuple{SQLCompose.CharType, SQLCompose.TextType, SQLCompose.Int4Type}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
            aircraft_code
            model
            range
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        aircrafts_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(AircraftsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(AircraftsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{AircraftsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{AircraftsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(AircraftsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_aircrafts() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(AircraftsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_aircrafts(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(AircraftsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::AircraftsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.model, SQLCompose.nextalias(alias, :model), i)
                i = SQLCompose.foreachfield(f, result.range, SQLCompose.nextalias(alias, :range), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::AircraftsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            AircraftsRow(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.model, SQLCompose.nextalias(alias, :model)), SQLCompose.mapfields(f, result.range, SQLCompose.nextalias(alias, :range)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::AircraftsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.model, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.range, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct Aircrafts_DataRow <: SQLCompose.RowStruct{SQLCompose.RowType{:aircrafts_data, (:aircraft_code, :model, :range), Tuple{SQLCompose.CharType, SQLCompose.JSONType, SQLCompose.Int4Type}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
            aircraft_code
            model
            range
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        aircrafts_data_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(Aircrafts_DataRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(Aircrafts_DataRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{Aircrafts_DataRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{Aircrafts_DataRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(Aircrafts_DataRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_aircrafts_data() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(Aircrafts_DataRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_aircrafts_data(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Aircrafts_DataRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::Aircrafts_DataRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.model, SQLCompose.nextalias(alias, :model), i)
                i = SQLCompose.foreachfield(f, result.range, SQLCompose.nextalias(alias, :range), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::Aircrafts_DataRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            Aircrafts_DataRow(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.model, SQLCompose.nextalias(alias, :model)), SQLCompose.mapfields(f, result.range, SQLCompose.nextalias(alias, :range)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Aircrafts_DataRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.model, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.range, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct AirportsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:airports, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{SQLCompose.CharType, SQLCompose.TextType, SQLCompose.TextType, SQLCompose.UnknownType, SQLCompose.TextType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        airports_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(AirportsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(AirportsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{AirportsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{AirportsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(AirportsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_airports() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(AirportsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_airports(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(AirportsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::AirportsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
                i = SQLCompose.foreachfield(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code), i)
                i = SQLCompose.foreachfield(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates), i)
                i = SQLCompose.foreachfield(f, result.timezone, SQLCompose.nextalias(alias, :timezone), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::AirportsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            AirportsRow(SQLCompose.mapfields(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code)), SQLCompose.mapfields(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates)), SQLCompose.mapfields(f, result.timezone, SQLCompose.nextalias(alias, :timezone)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::AirportsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.coordinates, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.timezone, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct Airports_DataRow <: SQLCompose.RowStruct{SQLCompose.RowType{:airports_data, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{SQLCompose.CharType, SQLCompose.JSONType, SQLCompose.JSONType, SQLCompose.UnknownType, SQLCompose.TextType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        airports_data_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(Airports_DataRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(Airports_DataRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{Airports_DataRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{Airports_DataRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(Airports_DataRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_airports_data() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(Airports_DataRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_airports_data(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Airports_DataRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::Airports_DataRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
                i = SQLCompose.foreachfield(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code), i)
                i = SQLCompose.foreachfield(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates), i)
                i = SQLCompose.foreachfield(f, result.timezone, SQLCompose.nextalias(alias, :timezone), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::Airports_DataRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            Airports_DataRow(SQLCompose.mapfields(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code)), SQLCompose.mapfields(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates)), SQLCompose.mapfields(f, result.timezone, SQLCompose.nextalias(alias, :timezone)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Airports_DataRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.coordinates, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.timezone, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct Boarding_PassesRow <: SQLCompose.RowStruct{SQLCompose.RowType{:boarding_passes, (:ticket_no, :flight_id, :boarding_no, :seat_no), Tuple{SQLCompose.CharType, SQLCompose.Int4Type, SQLCompose.Int4Type, SQLCompose.VarCharType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
            ticket_no
            flight_id
            boarding_no
            seat_no
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        boarding_passes_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(Boarding_PassesRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(Boarding_PassesRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{Boarding_PassesRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{Boarding_PassesRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(Boarding_PassesRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_boarding_passes() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(Boarding_PassesRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_boarding_passes(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Boarding_PassesRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::Boarding_PassesRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.boarding_no, SQLCompose.nextalias(alias, :boarding_no), i)
                i = SQLCompose.foreachfield(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::Boarding_PassesRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            Boarding_PassesRow(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.boarding_no, SQLCompose.nextalias(alias, :boarding_no)), SQLCompose.mapfields(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Boarding_PassesRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.ticket_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.boarding_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.seat_no, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct BookingsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:bookings, (:book_ref, :book_date, :total_amount), Tuple{SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
            book_ref
            book_date
            total_amount
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        bookings_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(BookingsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(BookingsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{BookingsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{BookingsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(BookingsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_bookings() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(BookingsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_bookings(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(BookingsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::BookingsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
                i = SQLCompose.foreachfield(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref), i)
                i = SQLCompose.foreachfield(f, result.book_date, SQLCompose.nextalias(alias, :book_date), i)
                i = SQLCompose.foreachfield(f, result.total_amount, SQLCompose.nextalias(alias, :total_amount), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::BookingsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            BookingsRow(SQLCompose.mapfields(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref)), SQLCompose.mapfields(f, result.book_date, SQLCompose.nextalias(alias, :book_date)), SQLCompose.mapfields(f, result.total_amount, SQLCompose.nextalias(alias, :total_amount)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::BookingsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.book_ref, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.book_date, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.total_amount, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct FlightsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:flights, (:flight_id, :flight_no, :scheduled_departure, :scheduled_arrival, :departure_airport, :arrival_airport, :status, :aircraft_code, :actual_departure, :actual_arrival), Tuple{SQLCompose.Int4Type, SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.CharType, SQLCompose.CharType, SQLCompose.VarCharType, SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        flights_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(FlightsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(FlightsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{FlightsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{FlightsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(FlightsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_flights() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(FlightsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_flights(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(FlightsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::FlightsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::FlightsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            FlightsRow(SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure)), SQLCompose.mapfields(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.status, SQLCompose.nextalias(alias, :status)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure)), SQLCompose.mapfields(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::FlightsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct Flights_VRow <: SQLCompose.RowStruct{SQLCompose.RowType{:flights_v, (:flight_id, :flight_no, :scheduled_departure, :scheduled_departure_local, :scheduled_arrival, :scheduled_arrival_local, :scheduled_duration, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :status, :aircraft_code, :actual_departure, :actual_departure_local, :actual_arrival, :actual_arrival_local, :actual_duration), Tuple{SQLCompose.Int4Type, SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType, SQLCompose.CharType, SQLCompose.TextType, SQLCompose.TextType, SQLCompose.CharType, SQLCompose.TextType, SQLCompose.TextType, SQLCompose.VarCharType, SQLCompose.CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        flights_v_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(Flights_VRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(Flights_VRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{Flights_VRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{Flights_VRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(Flights_VRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_flights_v() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(Flights_VRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_flights_v(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Flights_VRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::Flights_VRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::Flights_VRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            Flights_VRow(SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure)), SQLCompose.mapfields(f, result.scheduled_departure_local, SQLCompose.nextalias(alias, :scheduled_departure_local)), SQLCompose.mapfields(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival)), SQLCompose.mapfields(f, result.scheduled_arrival_local, SQLCompose.nextalias(alias, :scheduled_arrival_local)), SQLCompose.mapfields(f, result.scheduled_duration, SQLCompose.nextalias(alias, :scheduled_duration)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name)), SQLCompose.mapfields(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name)), SQLCompose.mapfields(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city)), SQLCompose.mapfields(f, result.status, SQLCompose.nextalias(alias, :status)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure)), SQLCompose.mapfields(f, result.actual_departure_local, SQLCompose.nextalias(alias, :actual_departure_local)), SQLCompose.mapfields(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival)), SQLCompose.mapfields(f, result.actual_arrival_local, SQLCompose.nextalias(alias, :actual_arrival_local)), SQLCompose.mapfields(f, result.actual_duration, SQLCompose.nextalias(alias, :actual_duration)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Flights_VRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct RoutesRow <: SQLCompose.RowStruct{SQLCompose.RowType{:routes, (:flight_no, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :aircraft_code, :duration, :days_of_week), Tuple{SQLCompose.CharType, SQLCompose.CharType, SQLCompose.TextType, SQLCompose.TextType, SQLCompose.CharType, SQLCompose.TextType, SQLCompose.TextType, SQLCompose.CharType, SQLCompose.IntervalType, SQLCompose.ArrayType{SQLCompose.Int4Type}}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        routes_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(RoutesRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(RoutesRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{RoutesRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{RoutesRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(RoutesRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_routes() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(RoutesRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_routes(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(RoutesRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::RoutesRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::RoutesRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            RoutesRow(SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name)), SQLCompose.mapfields(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name)), SQLCompose.mapfields(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.duration, SQLCompose.nextalias(alias, :duration)), SQLCompose.mapfields(f, result.days_of_week, SQLCompose.nextalias(alias, :days_of_week)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::RoutesRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
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
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct SeatsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:seats, (:aircraft_code, :seat_no, :fare_conditions), Tuple{SQLCompose.CharType, SQLCompose.VarCharType, SQLCompose.VarCharType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
            aircraft_code
            seat_no
            fare_conditions
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        seats_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(SeatsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(SeatsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{SeatsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{SeatsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(SeatsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_seats() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(SeatsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_seats(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(SeatsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::SeatsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no), i)
                i = SQLCompose.foreachfield(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::SeatsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            SeatsRow(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no)), SQLCompose.mapfields(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::SeatsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.seat_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.fare_conditions, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct Ticket_FlightsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:ticket_flights, (:ticket_no, :flight_id, :fare_conditions, :amount), Tuple{SQLCompose.CharType, SQLCompose.Int4Type, SQLCompose.VarCharType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
            ticket_no
            flight_id
            fare_conditions
            amount
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        ticket_flights_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(Ticket_FlightsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(Ticket_FlightsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{Ticket_FlightsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{Ticket_FlightsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(Ticket_FlightsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_ticket_flights() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(Ticket_FlightsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_ticket_flights(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Ticket_FlightsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::Ticket_FlightsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions), i)
                i = SQLCompose.foreachfield(f, result.amount, SQLCompose.nextalias(alias, :amount), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::Ticket_FlightsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            Ticket_FlightsRow(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions)), SQLCompose.mapfields(f, result.amount, SQLCompose.nextalias(alias, :amount)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Ticket_FlightsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.ticket_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.fare_conditions, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.amount, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:92 =#
        struct TicketsRow <: SQLCompose.RowStruct{SQLCompose.RowType{:tickets, (:ticket_no, :book_ref, :passenger_id, :passenger_name, :contact_data), Tuple{SQLCompose.CharType, SQLCompose.CharType, SQLCompose.VarCharType, SQLCompose.TextType, SQLCompose.JSONType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:59 =#
            ticket_no
            book_ref
            passenger_id
            passenger_name
            contact_data
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        tickets_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:68 =#
                SQLCompose.table(TicketsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        let q = SQLCompose.SelectQuery(TicketsRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
            global SQLCompose.query(::Type{TicketsRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:63 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        SQLCompose.query(::Type{TicketsRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:66 =#
                SQLCompose.QuerySet(query(TicketsRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        query_tickets() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:70 =#
                query(TicketsRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_tickets(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(TicketsRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        function SQLCompose.foreachfield(f::Function, result::TicketsRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref), i)
                i = SQLCompose.foreachfield(f, result.passenger_id, SQLCompose.nextalias(alias, :passenger_id), i)
                i = SQLCompose.foreachfield(f, result.passenger_name, SQLCompose.nextalias(alias, :passenger_name), i)
                i = SQLCompose.foreachfield(f, result.contact_data, SQLCompose.nextalias(alias, :contact_data), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.mapfields(f::Function, result::TicketsRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:81 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            TicketsRow(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref)), SQLCompose.mapfields(f, result.passenger_id, SQLCompose.nextalias(alias, :passenger_id)), SQLCompose.mapfields(f, result.passenger_name, SQLCompose.nextalias(alias, :passenger_name)), SQLCompose.mapfields(f, result.contact_data, SQLCompose.nextalias(alias, :contact_data)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::TicketsRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:86 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.ticket_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.book_ref, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.passenger_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.passenger_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.contact_data, tableitem)
        end
    end
    #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:133 =#
    ticket_flights_of(boarding_passes::Boarding_PassesRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:113 =#
            SQLCompose.reference(Ticket_FlightsRow, (:ticket_no, :flight_id), (boarding_passes.ticket_no, boarding_passes.flight_id))
        end
    arrival_airport_of(flights::FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:113 =#
            SQLCompose.reference(Airports_DataRow, (:airport_code,), (flights.arrival_airport,))
        end
    departure_airport_of(flights::FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:113 =#
            SQLCompose.reference(Airports_DataRow, (:airport_code,), (flights.departure_airport,))
        end
    aircrafts_data_of(flights::FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:113 =#
            SQLCompose.reference(Aircrafts_DataRow, (:aircraft_code,), (flights.aircraft_code,))
        end
    aircrafts_data_of(seats::SeatsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:113 =#
            SQLCompose.reference(Aircrafts_DataRow, (:aircraft_code,), (seats.aircraft_code,))
        end
    flights_of(ticket_flights::Ticket_FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:113 =#
            SQLCompose.reference(FlightsRow, (:flight_id,), (ticket_flights.flight_id,))
        end
    tickets_of(ticket_flights::Ticket_FlightsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:113 =#
            SQLCompose.reference(TicketsRow, (:ticket_no,), (ticket_flights.ticket_no,))
        end
    bookings_of(tickets::TicketsRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:113 =#
            SQLCompose.reference(BookingsRow, (:book_ref,), (tickets.book_ref,))
        end
end
end