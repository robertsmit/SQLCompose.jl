#=
numberic:
- Julia version: 
- Author: Rob
- Date: 2022-04-18
=#
export Int8Type, Int4Type, Int2Type, Float8Type, Float4Type

abstract type NumericType <: SQLType end

abstract type IntegerType <: NumericType end

#-32768 to +32767
#smallint
struct Int2Type <: IntegerType end

#integer int4
struct Int4Type <: IntegerType end

#bigint
struct Int8Type <: IntegerType end


abstract type FloatType <: NumericType end

#6 decimal digits precision
#real
struct Float4Type <: FloatType end

#15 decimal digits precision
#double
struct Float8Type <: FloatType end

struct DecimalType <: NumericType
    precision
    scale
end

DecimalType(precision) = DecimalType(precision, missing)
DecimalType() = DecimalType(missing, missing)