struct DateType <: SQLType end

struct TimeType <: SQLType
    with_zone::Bool
    precision::Union{Integer,Nothing}
    TimeType(z, precision) = (@assert precision in 0:6; new(z, precision))
end

TimeType(with_zone::Bool=false, precision=nothing) = TimeType(with_zone, precision)

struct TimestampType <: SQLType
    with_zone::Bool
    precision::Union{Integer,Nothing}
    TimestampType(z, precision) = (@assert precision in 0:6; new(z, precision))
end

TimestampType(with_zone::Bool=false, precision=nothing) = TimestampType(with_zone, precision)

# Interval
@enum IntervalFields begin
    iv_fields_year
    iv_fields_month
    iv_fields_day
    iv_fields_hour
    iv_fields_minute
    iv_fields_second
    iv_fields_year_to_month
    iv_fields_day_to_hour
    iv_fields_day_to_minute
    iv_fields_day_to_second
    iv_fields_hour_to_minute
    iv_fields_hour_to_second
    iv_fields_minute_to_second
end

"Julia period"
struct IntervalType <: SQLType
    fields::Union{IntervalFields,Nothing}
    precision::Union{Integer,Nothing}
end

IntervalType(fields::IntervalFields) = IntervalType(fields, nothing)
IntervalType(precision::Integer) = IntervalType(nothing, precision)