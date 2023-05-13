module Bookings
#= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:14 =#
#= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:15 =#
using SQLCompose
#= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:16 =#
begin
    #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:117 =#
    export Aircraft, Aircrafts_Data, Airport, Airports_Data, Boarding_Pass, Booking, Flight, Flights_V, Route, Seat, Ticket_Flight, Ticket
    export ticket_flight_of, arrival_airport_of, departure_airport_of, aircrafts_data_of, aircrafts_data_of, flight_of, ticket_of, booking_of
    export all_boarding_pass_of, all_arrival_airport_of, all_departure_airport_of, all_flight_of, all_seat_of, all_ticket_flight_of, all_ticket_flight_of, all_ticket_of
    #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:118 =#
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Aircraft <: SQLCompose.RowStruct{RowType{:aircrafts, (:aircraft_code, :model, :range), Tuple{CharType, TextType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            aircraft_code
            model
            range
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Aircraft, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.model, SQLCompose.nextalias(alias, :model), i)
                i = SQLCompose.foreachfield(f, result.range, SQLCompose.nextalias(alias, :range), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Aircraft, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Aircraft(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.model, SQLCompose.nextalias(alias, :model)), SQLCompose.mapfields(f, result.range, SQLCompose.nextalias(alias, :range)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Aircraft, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.model, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.range, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Aircrafts_Data <: SQLCompose.RowStruct{RowType{:aircrafts_data, (:aircraft_code, :model, :range), Tuple{CharType, SQLCompose.JSONType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            aircraft_code
            model
            range
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Aircrafts_Data, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.model, SQLCompose.nextalias(alias, :model), i)
                i = SQLCompose.foreachfield(f, result.range, SQLCompose.nextalias(alias, :range), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Aircrafts_Data, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Aircrafts_Data(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.model, SQLCompose.nextalias(alias, :model)), SQLCompose.mapfields(f, result.range, SQLCompose.nextalias(alias, :range)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Aircrafts_Data, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.model, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.range, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Airport <: SQLCompose.RowStruct{RowType{:airports, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{CharType, TextType, TextType, SQLCompose.UnknownType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Airport, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code), i)
                i = SQLCompose.foreachfield(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates), i)
                i = SQLCompose.foreachfield(f, result.timezone, SQLCompose.nextalias(alias, :timezone), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Airport, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Airport(SQLCompose.mapfields(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code)), SQLCompose.mapfields(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates)), SQLCompose.mapfields(f, result.timezone, SQLCompose.nextalias(alias, :timezone)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Airport, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.coordinates, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.timezone, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Airports_Data <: SQLCompose.RowStruct{RowType{:airports_data, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{CharType, SQLCompose.JSONType, SQLCompose.JSONType, SQLCompose.UnknownType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Airports_Data, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code), i)
                i = SQLCompose.foreachfield(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates), i)
                i = SQLCompose.foreachfield(f, result.timezone, SQLCompose.nextalias(alias, :timezone), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Airports_Data, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Airports_Data(SQLCompose.mapfields(f, result.airport_code, SQLCompose.nextalias(alias, :airport_code)), SQLCompose.mapfields(f, result.airport_name, SQLCompose.nextalias(alias, :airport_name)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.coordinates, SQLCompose.nextalias(alias, :coordinates)), SQLCompose.mapfields(f, result.timezone, SQLCompose.nextalias(alias, :timezone)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Airports_Data, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.airport_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.coordinates, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.timezone, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Boarding_Pass <: SQLCompose.RowStruct{RowType{:boarding_passes, (:ticket_no, :flight_id, :boarding_no, :seat_no), Tuple{CharType, Int4Type, Int4Type, SQLCompose.VarCharType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            ticket_no
            flight_id
            boarding_no
            seat_no
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Boarding_Pass, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.boarding_no, SQLCompose.nextalias(alias, :boarding_no), i)
                i = SQLCompose.foreachfield(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Boarding_Pass, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Boarding_Pass(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.boarding_no, SQLCompose.nextalias(alias, :boarding_no)), SQLCompose.mapfields(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Boarding_Pass, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.ticket_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.boarding_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.seat_no, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Booking <: SQLCompose.RowStruct{RowType{:bookings, (:book_ref, :book_date, :total_amount), Tuple{CharType, SQLCompose.TimestampType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            book_ref
            book_date
            total_amount
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Booking, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref), i)
                i = SQLCompose.foreachfield(f, result.book_date, SQLCompose.nextalias(alias, :book_date), i)
                i = SQLCompose.foreachfield(f, result.total_amount, SQLCompose.nextalias(alias, :total_amount), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Booking, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Booking(SQLCompose.mapfields(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref)), SQLCompose.mapfields(f, result.book_date, SQLCompose.nextalias(alias, :book_date)), SQLCompose.mapfields(f, result.total_amount, SQLCompose.nextalias(alias, :total_amount)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Booking, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.book_ref, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.book_date, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.total_amount, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Flight <: SQLCompose.RowStruct{RowType{:flights, (:flight_id, :flight_no, :scheduled_departure, :scheduled_arrival, :departure_airport, :arrival_airport, :status, :aircraft_code, :actual_departure, :actual_arrival), Tuple{Int4Type, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, CharType, CharType, SQLCompose.VarCharType, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Flight, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Flight, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Flight(SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure)), SQLCompose.mapfields(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.status, SQLCompose.nextalias(alias, :status)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure)), SQLCompose.mapfields(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Flight, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Flights_V <: SQLCompose.RowStruct{RowType{:flights_v, (:flight_id, :flight_no, :scheduled_departure, :scheduled_departure_local, :scheduled_arrival, :scheduled_arrival_local, :scheduled_duration, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :status, :aircraft_code, :actual_departure, :actual_departure_local, :actual_arrival, :actual_arrival_local, :actual_duration), Tuple{Int4Type, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType, CharType, TextType, TextType, CharType, TextType, TextType, SQLCompose.VarCharType, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Flights_V, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Flights_V, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Flights_V(SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.scheduled_departure, SQLCompose.nextalias(alias, :scheduled_departure)), SQLCompose.mapfields(f, result.scheduled_departure_local, SQLCompose.nextalias(alias, :scheduled_departure_local)), SQLCompose.mapfields(f, result.scheduled_arrival, SQLCompose.nextalias(alias, :scheduled_arrival)), SQLCompose.mapfields(f, result.scheduled_arrival_local, SQLCompose.nextalias(alias, :scheduled_arrival_local)), SQLCompose.mapfields(f, result.scheduled_duration, SQLCompose.nextalias(alias, :scheduled_duration)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name)), SQLCompose.mapfields(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name)), SQLCompose.mapfields(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city)), SQLCompose.mapfields(f, result.status, SQLCompose.nextalias(alias, :status)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.actual_departure, SQLCompose.nextalias(alias, :actual_departure)), SQLCompose.mapfields(f, result.actual_departure_local, SQLCompose.nextalias(alias, :actual_departure_local)), SQLCompose.mapfields(f, result.actual_arrival, SQLCompose.nextalias(alias, :actual_arrival)), SQLCompose.mapfields(f, result.actual_arrival_local, SQLCompose.nextalias(alias, :actual_arrival_local)), SQLCompose.mapfields(f, result.actual_duration, SQLCompose.nextalias(alias, :actual_duration)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Flights_V, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Route <: SQLCompose.RowStruct{RowType{:routes, (:flight_no, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :aircraft_code, :duration, :days_of_week), Tuple{CharType, CharType, TextType, TextType, CharType, TextType, TextType, CharType, SQLCompose.IntervalType, SQLCompose.ArrayType{Int4Type}}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Route, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Route, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Route(SQLCompose.mapfields(f, result.flight_no, SQLCompose.nextalias(alias, :flight_no)), SQLCompose.mapfields(f, result.departure_airport, SQLCompose.nextalias(alias, :departure_airport)), SQLCompose.mapfields(f, result.departure_airport_name, SQLCompose.nextalias(alias, :departure_airport_name)), SQLCompose.mapfields(f, result.departure_city, SQLCompose.nextalias(alias, :departure_city)), SQLCompose.mapfields(f, result.arrival_airport, SQLCompose.nextalias(alias, :arrival_airport)), SQLCompose.mapfields(f, result.arrival_airport_name, SQLCompose.nextalias(alias, :arrival_airport_name)), SQLCompose.mapfields(f, result.arrival_city, SQLCompose.nextalias(alias, :arrival_city)), SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.duration, SQLCompose.nextalias(alias, :duration)), SQLCompose.mapfields(f, result.days_of_week, SQLCompose.nextalias(alias, :days_of_week)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Route, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Seat <: SQLCompose.RowStruct{RowType{:seats, (:aircraft_code, :seat_no, :fare_conditions), Tuple{CharType, SQLCompose.VarCharType, SQLCompose.VarCharType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            aircraft_code
            seat_no
            fare_conditions
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Seat, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code), i)
                i = SQLCompose.foreachfield(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no), i)
                i = SQLCompose.foreachfield(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Seat, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Seat(SQLCompose.mapfields(f, result.aircraft_code, SQLCompose.nextalias(alias, :aircraft_code)), SQLCompose.mapfields(f, result.seat_no, SQLCompose.nextalias(alias, :seat_no)), SQLCompose.mapfields(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Seat, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.aircraft_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.seat_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.fare_conditions, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Ticket_Flight <: SQLCompose.RowStruct{RowType{:ticket_flights, (:ticket_no, :flight_id, :fare_conditions, :amount), Tuple{CharType, Int4Type, SQLCompose.VarCharType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            ticket_no
            flight_id
            fare_conditions
            amount
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Ticket_Flight, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id), i)
                i = SQLCompose.foreachfield(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions), i)
                i = SQLCompose.foreachfield(f, result.amount, SQLCompose.nextalias(alias, :amount), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Ticket_Flight, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Ticket_Flight(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.flight_id, SQLCompose.nextalias(alias, :flight_id)), SQLCompose.mapfields(f, result.fare_conditions, SQLCompose.nextalias(alias, :fare_conditions)), SQLCompose.mapfields(f, result.amount, SQLCompose.nextalias(alias, :amount)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Ticket_Flight, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.ticket_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.flight_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.fare_conditions, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.amount, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Ticket <: SQLCompose.RowStruct{RowType{:tickets, (:ticket_no, :book_ref, :passenger_id, :passenger_name, :contact_data), Tuple{CharType, CharType, SQLCompose.VarCharType, TextType, SQLCompose.JSONType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            ticket_no
            book_ref
            passenger_id
            passenger_name
            contact_data
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Ticket, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no), i)
                i = SQLCompose.foreachfield(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref), i)
                i = SQLCompose.foreachfield(f, result.passenger_id, SQLCompose.nextalias(alias, :passenger_id), i)
                i = SQLCompose.foreachfield(f, result.passenger_name, SQLCompose.nextalias(alias, :passenger_name), i)
                i = SQLCompose.foreachfield(f, result.contact_data, SQLCompose.nextalias(alias, :contact_data), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Ticket, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Ticket(SQLCompose.mapfields(f, result.ticket_no, SQLCompose.nextalias(alias, :ticket_no)), SQLCompose.mapfields(f, result.book_ref, SQLCompose.nextalias(alias, :book_ref)), SQLCompose.mapfields(f, result.passenger_id, SQLCompose.nextalias(alias, :passenger_id)), SQLCompose.mapfields(f, result.passenger_name, SQLCompose.nextalias(alias, :passenger_name)), SQLCompose.mapfields(f, result.contact_data, SQLCompose.nextalias(alias, :contact_data)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Ticket, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.ticket_no, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.book_ref, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.passenger_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.passenger_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.contact_data, tableitem)
        end
    end
    #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:119 =#
    ticket_flight_of(boarding_passes::Boarding_Pass) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Ticket_Flight, (:ticket_no, :flight_id), (boarding_passes.ticket_no, boarding_passes.flight_id))
        end
    arrival_airport_of(flights::Flight) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Airports_Data, (:airport_code,), (flights.arrival_airport,))
        end
    departure_airport_of(flights::Flight) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Airports_Data, (:airport_code,), (flights.departure_airport,))
        end
    aircrafts_data_of(flights::Flight) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Aircrafts_Data, (:aircraft_code,), (flights.aircraft_code,))
        end
    aircrafts_data_of(seats::Seat) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Aircrafts_Data, (:aircraft_code,), (seats.aircraft_code,))
        end
    flight_of(ticket_flights::Ticket_Flight) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Flight, (:flight_id,), (ticket_flights.flight_id,))
        end
    ticket_of(ticket_flights::Ticket_Flight) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Ticket, (:ticket_no,), (ticket_flights.ticket_no,))
        end
    booking_of(tickets::Ticket) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Booking, (:book_ref,), (tickets.book_ref,))
        end
    #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:120 =#
    all_boarding_pass_of(ticket_flights::Ticket_Flight) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Boarding_Pass, (:ticket_no, :flight_id), (ticket_flights.ticket_no, ticket_flights.flight_id))
        end
    all_arrival_airport_of(airports_data::Airports_Data) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Flight, (:arrival_airport,), (airports_data.airport_code,))
        end
    all_departure_airport_of(airports_data::Airports_Data) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Flight, (:departure_airport,), (airports_data.airport_code,))
        end
    all_flight_of(aircrafts_data::Aircrafts_Data) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Flight, (:aircraft_code,), (aircrafts_data.aircraft_code,))
        end
    all_seat_of(aircrafts_data::Aircrafts_Data) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Seat, (:aircraft_code,), (aircrafts_data.aircraft_code,))
        end
    all_ticket_flight_of(flights::Flight) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Ticket_Flight, (:flight_id,), (flights.flight_id,))
        end
    all_ticket_flight_of(tickets::Ticket) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Ticket_Flight, (:ticket_no,), (tickets.ticket_no,))
        end
    all_ticket_of(bookings::Booking) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Ticket, (:book_ref,), (bookings.book_ref,))
        end
end
end