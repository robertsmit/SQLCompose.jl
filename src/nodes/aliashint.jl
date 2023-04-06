#=
aliashint:
- Julia version: 
- Author: Rob
- Date: 2022-05-06
=#
aliashint(arg::TableItemRef) = arg.aliashint
aliashint(arg::TableDefinition) = arg.aliashint
aliashint(arg::TableItem) = aliashint(arg.ref)
aliashint(arg::TableItemFieldRef) = aliashint(arg.table)
aliashint(arg::Query) = :q
aliashint(arg::FromItem) = :q
