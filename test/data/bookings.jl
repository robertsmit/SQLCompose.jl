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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Aircraft <: SQLCompose.RowStruct{RowType{:aircrafts, (:aircraft_code, :model, :range), Tuple{CharType, TextType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            aircraft_code
            model
            range
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Aircrafts_Data <: SQLCompose.RowStruct{RowType{:aircrafts_data, (:aircraft_code, :model, :range), Tuple{CharType, SQLCompose.JSONType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            aircraft_code
            model
            range
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Airport <: SQLCompose.RowStruct{RowType{:airports, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{CharType, TextType, TextType, SQLCompose.UnknownType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Airports_Data <: SQLCompose.RowStruct{RowType{:airports_data, (:airport_code, :airport_name, :city, :coordinates, :timezone), Tuple{CharType, SQLCompose.JSONType, SQLCompose.JSONType, SQLCompose.UnknownType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            airport_code
            airport_name
            city
            coordinates
            timezone
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Boarding_Pass <: SQLCompose.RowStruct{RowType{:boarding_passes, (:ticket_no, :flight_id, :boarding_no, :seat_no), Tuple{CharType, Int4Type, Int4Type, SQLCompose.VarCharType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            ticket_no
            flight_id
            boarding_no
            seat_no
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Booking <: SQLCompose.RowStruct{RowType{:bookings, (:book_ref, :book_date, :total_amount), Tuple{CharType, SQLCompose.TimestampType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            book_ref
            book_date
            total_amount
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Flight <: SQLCompose.RowStruct{RowType{:flights, (:flight_id, :flight_no, :scheduled_departure, :scheduled_arrival, :departure_airport, :arrival_airport, :status, :aircraft_code, :actual_departure, :actual_arrival), Tuple{Int4Type, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, CharType, CharType, SQLCompose.VarCharType, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
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
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Flights_V <: SQLCompose.RowStruct{RowType{:flights_v, (:flight_id, :flight_no, :scheduled_departure, :scheduled_departure_local, :scheduled_arrival, :scheduled_arrival_local, :scheduled_duration, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :status, :aircraft_code, :actual_departure, :actual_departure_local, :actual_arrival, :actual_arrival_local, :actual_duration), Tuple{Int4Type, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType, CharType, TextType, TextType, CharType, TextType, TextType, SQLCompose.VarCharType, CharType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.TimestampType, SQLCompose.IntervalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
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
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Route <: SQLCompose.RowStruct{RowType{:routes, (:flight_no, :departure_airport, :departure_airport_name, :departure_city, :arrival_airport, :arrival_airport_name, :arrival_city, :aircraft_code, :duration, :days_of_week), Tuple{CharType, CharType, TextType, TextType, CharType, TextType, TextType, CharType, SQLCompose.IntervalType, SQLCompose.ArrayType{Int4Type}}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
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
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Seat <: SQLCompose.RowStruct{RowType{:seats, (:aircraft_code, :seat_no, :fare_conditions), Tuple{CharType, SQLCompose.VarCharType, SQLCompose.VarCharType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            aircraft_code
            seat_no
            fare_conditions
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Ticket_Flight <: SQLCompose.RowStruct{RowType{:ticket_flights, (:ticket_no, :flight_id, :fare_conditions, :amount), Tuple{CharType, Int4Type, SQLCompose.VarCharType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            ticket_no
            flight_id
            fare_conditions
            amount
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Ticket <: SQLCompose.RowStruct{RowType{:tickets, (:ticket_no, :book_ref, :passenger_id, :passenger_name, :contact_data), Tuple{CharType, CharType, SQLCompose.VarCharType, TextType, SQLCompose.JSONType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            ticket_no
            book_ref
            passenger_id
            passenger_name
            contact_data
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