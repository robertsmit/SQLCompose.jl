import Base: string

printpsql_typeprecision(io::IO, ::Nothing) = nothing
printpsql_typeprecision(io::IO, precision) = print(io, "($precision)")

#Numerics
begin 
    printpsql(io::IO, ::Int2Type) = print(io, "smallint")
    printpsql(io::IO, ::Int4Type) = print(io, "integer")
    printpsql(io::IO, ::Int8Type) = print(io, "bigint")
    printpsql(io::IO, ::Float4Type) = print(io, "real")
    printpsql(io::IO, ::Float8Type) = print(io, "double precision")

    #Decimal
    begin
        printpsql(io::IO, d::DecimalType) = (print(io, "decimal"); printpsql_decimalprecision(io, d))
        printpsql_decimalprecision(io, d::DecimalType) = printpsql_decimalprecision(io, d.precision, d.scale)
        printpsql_decimalprecision(io, ::Nothing, ::Nothing) = nothing
        printpsql_decimalprecision(io, precision::Integer, ::Nothing) = printpsql_typeprecision(io, precision)
        printpsql_decimalprecision(io, precision::Integer, scale::Integer) = print(io, "($precision, $scale)")
    end
end

begin #Character
    printpsql(io::IO, ::TextType) = print(io, "text")
    printpsql(io::IO, type::CharType) = print(io, "char($(type.length))")
    printpsql(io::IO, type::VarCharType) = print(io, "varchar($(type.length))")
end


begin #Misc
    printpsql(io::IO, ::UUIDType) = print(io, "uuid")
    printpsql(io::IO, ::BlobType) = print(io, "bytea")
    printpsql(io::IO, ::BooleanType) = print(io, "boolean")
end


begin #Temporal
    printpsql(io::IO, ::DateType) = print(io, "date")

    begin #Timestamp / Time
        printpsql(io::IO, t::TimestampType) = printpsql_temporal(io, t, "timestamp")
        printpsql(io::IO, t::TimeType) = printpsql_temporal(io, t, "time")
        printpsql_temporal(io::IO, t, prefix) = (print(io, prefix); printpsql_typezone(io, t.with_zone); printpsql_typeprecision(io, t.precision))
        printpsql_typezone(io, with_zone::Bool) = printpsql_typezone(io, Val(with_zone))
        printpsql_typezone(io, ::Val{true}) = print(io, " with time zone")
        printpsql_typezone(_, ::Val{false}) = nothing
    end

    
    begin #Interval
        string(::Val{iv_fields_year}) = "YEAR"
        string(::Val{iv_fields_month}) = "MONTH"
        string(::Val{iv_fields_day}) = "DAY"
        string(::Val{iv_fields_hour}) = "HOUR"
        string(::Val{iv_fields_minute}) = "MINUTE"
        string(::Val{iv_fields_second}) = "SECOND"
        string(::Val{iv_fields_year_to_month}) = "YEAR TO MONTH"
        string(::Val{iv_fields_day_to_hour}) = "DAY TO HOUR"
        string(::Val{iv_fields_day_to_minute}) = "DAY TO MINUTE"
        string(::Val{iv_fields_day_to_second}) = "DAY TO SECOND"
        string(::Val{iv_fields_hour_to_minute}) = "HOUR TO MINUTE"
        string(::Val{iv_fields_hour_to_second}) = "HOUR TO SECOND"
        string(::Val{iv_fields_minute_to_second}) = "MINUTE TO SECOND"

        printpsql_intervalfields(_, ::Nothing) = nothing
        printpsql_intervalfields(io, fields) = print(io, " $(string(Val(fields)))")

        printpsql(io::IO, i::IntervalType) = (print(io, "interval"); printpsql_intervalfields(io, i.fields); printpsql_typeprecision(io, i.precision))
    end

    begin #RangeType
        printpsql(io::IO, ::Type{RangeType{TimestampType}}) = print(io, "tsrange")
        printpsql(io::IO, ::Type{RangeType{DateType}}) = print(io, "daterange")
        printpsql(io::IO, ::Type{RangeType{Int4Type}}) = print(io, "int4range")
        printpsql(io::IO, ::Type{RangeType{Int8Type}}) = print(io, "int8range")
        printpsql(io::IO, ::Type{RangeType{<:NumericType}}) = print(io, "numrange")
    end
end

printpsql(io::IO, rt::RowType) = print(io, rt.name)
