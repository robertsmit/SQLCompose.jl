
aliashint(arg::TableItemRef) = arg.aliashint
aliashint(arg::TableSource) = arg.aliashint
aliashint(arg::TableItem) = aliashint(arg.ref)
aliashint(arg::TableItemFieldRef) = aliashint(arg.table)