module Pagila
#= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:15 =#
#= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:16 =#
using SQLCompose
#= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:17 =#
begin
    #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:132 =#
    export ActorRow, Actor_InfoRow, AddressRow, CategoryRow, CityRow, CountryRow, CustomerRow, Customer_ListRow, FilmRow, Film_ActorRow, Film_Actor_ExtensionRow, Film_Actor_Extension2Row, Film_CategoryRow, Film_ListRow, InventoryRow, Inventory_ItemRow, Inventory_Item2Row, Inventory_Item3Row, Inventory_Item4Row, LanguageRow, Nicer_But_Slower_Film_ListRow, PaymentRow, RentalRow, Sales_By_Film_CategoryRow, Sales_By_StoreRow, StaffRow, Staff_ListRow, StoreRow
    export city_of, country_of, store_of, address_of, language_of, original_language_of, actor_of, film_of, actor_of, actor_film_of, actor_of, film_of, category_of, film_of, film_of, store_of, customer_of, inventory_of, staff_of, address_of, store_of, address_of
    export actor_table, actor_info_table, address_table, category_table, city_table, country_table, customer_table, customer_list_table, film_table, film_actor_table, film_actor_extension_table, film_actor_extension2_table, film_category_table, film_list_table, inventory_table, inventory_item_table, inventory_item2_table, inventory_item3_table, inventory_item4_table, language_table, nicer_but_slower_film_list_table, payment_table, rental_table, sales_by_film_category_table, sales_by_store_table, staff_table, staff_list_table, store_table
    export query_actor, query_actor_info, query_address, query_category, query_city, query_country, query_customer, query_customer_list, query_film, query_film_actor, query_film_actor_extension, query_film_actor_extension2, query_film_category, query_film_list, query_inventory, query_inventory_item, query_inventory_item2, query_inventory_item3, query_inventory_item4, query_language, query_nicer_but_slower_film_list, query_payment, query_rental, query_sales_by_film_category, query_sales_by_store, query_staff, query_staff_list, query_store
    #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:133 =#
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct ActorRow <: SQLCompose.RowStruct{SQLCompose.RowType{:actor, (:actor_id, :first_name, :last_name, :last_update, :column_name, :column_name2, :column_name3, :column_name5, :column_name6, :column_name7, :column_name9, :column_name10, :column_name11, :column_name12, :column_name13, :column_name15, :squares, :squaresone, :whooss, :dwhooss, :ddwhooss, :ddddwhooss, :aap, :maki), Tuple{Int4Type, TextType, TextType, SQLCompose.TimestampType, SQLCompose.DecimalType, Int8Type, Float4Type, Float8Type, SQLCompose.CharType, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.TimeType, SQLCompose.IntervalType, SQLCompose.IntervalType, SQLCompose.TimestampType, SQLCompose.IntervalType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.IntervalType}, SQLCompose.ArrayType{SQLCompose.IntervalType}, SQLCompose.ArrayType{SQLCompose.IntervalType}, SQLCompose.ArrayType{SQLCompose.VarCharType}, SQLCompose.RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}, SQLCompose.ArrayType{SQLCompose.RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}}}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            actor_id
            first_name
            last_name
            last_update
            column_name
            column_name2
            column_name3
            column_name5
            column_name6
            column_name7
            column_name9
            column_name10
            column_name11
            column_name12
            column_name13
            column_name15
            squares
            squaresone
            whooss
            dwhooss
            ddwhooss
            ddddwhooss
            aap
            maki
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        actor_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(ActorRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(ActorRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{ActorRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{ActorRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(ActorRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_actor() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(ActorRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_actor(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(ActorRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::ActorRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.first_name, SQLCompose.nextalias(alias, :first_name), i)
                i = SQLCompose.foreachfield(f, result.last_name, SQLCompose.nextalias(alias, :last_name), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
                i = SQLCompose.foreachfield(f, result.column_name, SQLCompose.nextalias(alias, :column_name), i)
                i = SQLCompose.foreachfield(f, result.column_name2, SQLCompose.nextalias(alias, :column_name2), i)
                i = SQLCompose.foreachfield(f, result.column_name3, SQLCompose.nextalias(alias, :column_name3), i)
                i = SQLCompose.foreachfield(f, result.column_name5, SQLCompose.nextalias(alias, :column_name5), i)
                i = SQLCompose.foreachfield(f, result.column_name6, SQLCompose.nextalias(alias, :column_name6), i)
                i = SQLCompose.foreachfield(f, result.column_name7, SQLCompose.nextalias(alias, :column_name7), i)
                i = SQLCompose.foreachfield(f, result.column_name9, SQLCompose.nextalias(alias, :column_name9), i)
                i = SQLCompose.foreachfield(f, result.column_name10, SQLCompose.nextalias(alias, :column_name10), i)
                i = SQLCompose.foreachfield(f, result.column_name11, SQLCompose.nextalias(alias, :column_name11), i)
                i = SQLCompose.foreachfield(f, result.column_name12, SQLCompose.nextalias(alias, :column_name12), i)
                i = SQLCompose.foreachfield(f, result.column_name13, SQLCompose.nextalias(alias, :column_name13), i)
                i = SQLCompose.foreachfield(f, result.column_name15, SQLCompose.nextalias(alias, :column_name15), i)
                i = SQLCompose.foreachfield(f, result.squares, SQLCompose.nextalias(alias, :squares), i)
                i = SQLCompose.foreachfield(f, result.squaresone, SQLCompose.nextalias(alias, :squaresone), i)
                i = SQLCompose.foreachfield(f, result.whooss, SQLCompose.nextalias(alias, :whooss), i)
                i = SQLCompose.foreachfield(f, result.dwhooss, SQLCompose.nextalias(alias, :dwhooss), i)
                i = SQLCompose.foreachfield(f, result.ddwhooss, SQLCompose.nextalias(alias, :ddwhooss), i)
                i = SQLCompose.foreachfield(f, result.ddddwhooss, SQLCompose.nextalias(alias, :ddddwhooss), i)
                i = SQLCompose.foreachfield(f, result.aap, SQLCompose.nextalias(alias, :aap), i)
                i = SQLCompose.foreachfield(f, result.maki, SQLCompose.nextalias(alias, :maki), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::ActorRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            ActorRow(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.column_name, SQLCompose.nextalias(alias, :column_name)), SQLCompose.mapfields(f, result.column_name2, SQLCompose.nextalias(alias, :column_name2)), SQLCompose.mapfields(f, result.column_name3, SQLCompose.nextalias(alias, :column_name3)), SQLCompose.mapfields(f, result.column_name5, SQLCompose.nextalias(alias, :column_name5)), SQLCompose.mapfields(f, result.column_name6, SQLCompose.nextalias(alias, :column_name6)), SQLCompose.mapfields(f, result.column_name7, SQLCompose.nextalias(alias, :column_name7)), SQLCompose.mapfields(f, result.column_name9, SQLCompose.nextalias(alias, :column_name9)), SQLCompose.mapfields(f, result.column_name10, SQLCompose.nextalias(alias, :column_name10)), SQLCompose.mapfields(f, result.column_name11, SQLCompose.nextalias(alias, :column_name11)), SQLCompose.mapfields(f, result.column_name12, SQLCompose.nextalias(alias, :column_name12)), SQLCompose.mapfields(f, result.column_name13, SQLCompose.nextalias(alias, :column_name13)), SQLCompose.mapfields(f, result.column_name15, SQLCompose.nextalias(alias, :column_name15)), SQLCompose.mapfields(f, result.squares, SQLCompose.nextalias(alias, :squares)), SQLCompose.mapfields(f, result.squaresone, SQLCompose.nextalias(alias, :squaresone)), SQLCompose.mapfields(f, result.whooss, SQLCompose.nextalias(alias, :whooss)), SQLCompose.mapfields(f, result.dwhooss, SQLCompose.nextalias(alias, :dwhooss)), SQLCompose.mapfields(f, result.ddwhooss, SQLCompose.nextalias(alias, :ddwhooss)), SQLCompose.mapfields(f, result.ddddwhooss, SQLCompose.nextalias(alias, :ddddwhooss)), SQLCompose.mapfields(f, result.aap, SQLCompose.nextalias(alias, :aap)), SQLCompose.mapfields(f, result.maki, SQLCompose.nextalias(alias, :maki)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::ActorRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.actor_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.first_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name2, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name3, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name5, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name6, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name7, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name9, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name10, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name11, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name12, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name13, tableitem)
            SQLCompose.writelateralplan!(plan, node.column_name15, tableitem)
            SQLCompose.writelateralplan!(plan, node.squares, tableitem)
            SQLCompose.writelateralplan!(plan, node.squaresone, tableitem)
            SQLCompose.writelateralplan!(plan, node.whooss, tableitem)
            SQLCompose.writelateralplan!(plan, node.dwhooss, tableitem)
            SQLCompose.writelateralplan!(plan, node.ddwhooss, tableitem)
            SQLCompose.writelateralplan!(plan, node.ddddwhooss, tableitem)
            SQLCompose.writelateralplan!(plan, node.aap, tableitem)
            SQLCompose.writelateralplan!(plan, node.maki, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Actor_InfoRow <: SQLCompose.RowStruct{SQLCompose.RowType{:actor_info, (:actor_id, :first_name, :last_name, :film_info), Tuple{Int4Type, TextType, TextType, TextType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            actor_id
            first_name
            last_name
            film_info
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        actor_info_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Actor_InfoRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Actor_InfoRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Actor_InfoRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Actor_InfoRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Actor_InfoRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_actor_info() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Actor_InfoRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_actor_info(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Actor_InfoRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Actor_InfoRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.first_name, SQLCompose.nextalias(alias, :first_name), i)
                i = SQLCompose.foreachfield(f, result.last_name, SQLCompose.nextalias(alias, :last_name), i)
                i = SQLCompose.foreachfield(f, result.film_info, SQLCompose.nextalias(alias, :film_info), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Actor_InfoRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Actor_InfoRow(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.film_info, SQLCompose.nextalias(alias, :film_info)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Actor_InfoRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.actor_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.first_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.film_info, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct AddressRow <: SQLCompose.RowStruct{SQLCompose.RowType{:address, (:address_id, :address, :address2, :district, :city_id, :postal_code, :phone, :last_update), Tuple{Int4Type, TextType, TextType, TextType, Int4Type, TextType, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            address_id
            address
            address2
            district
            city_id
            postal_code
            phone
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        address_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(AddressRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(AddressRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{AddressRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{AddressRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(AddressRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_address() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(AddressRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_address(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(AddressRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::AddressRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.address_id, SQLCompose.nextalias(alias, :address_id), i)
                i = SQLCompose.foreachfield(f, result.address, SQLCompose.nextalias(alias, :address), i)
                i = SQLCompose.foreachfield(f, result.address2, SQLCompose.nextalias(alias, :address2), i)
                i = SQLCompose.foreachfield(f, result.district, SQLCompose.nextalias(alias, :district), i)
                i = SQLCompose.foreachfield(f, result.city_id, SQLCompose.nextalias(alias, :city_id), i)
                i = SQLCompose.foreachfield(f, result.postal_code, SQLCompose.nextalias(alias, :postal_code), i)
                i = SQLCompose.foreachfield(f, result.phone, SQLCompose.nextalias(alias, :phone), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::AddressRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            AddressRow(SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.address, SQLCompose.nextalias(alias, :address)), SQLCompose.mapfields(f, result.address2, SQLCompose.nextalias(alias, :address2)), SQLCompose.mapfields(f, result.district, SQLCompose.nextalias(alias, :district)), SQLCompose.mapfields(f, result.city_id, SQLCompose.nextalias(alias, :city_id)), SQLCompose.mapfields(f, result.postal_code, SQLCompose.nextalias(alias, :postal_code)), SQLCompose.mapfields(f, result.phone, SQLCompose.nextalias(alias, :phone)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::AddressRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.address_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.address, tableitem)
            SQLCompose.writelateralplan!(plan, node.address2, tableitem)
            SQLCompose.writelateralplan!(plan, node.district, tableitem)
            SQLCompose.writelateralplan!(plan, node.city_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.postal_code, tableitem)
            SQLCompose.writelateralplan!(plan, node.phone, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct CategoryRow <: SQLCompose.RowStruct{SQLCompose.RowType{:category, (:category_id, :name, :last_update), Tuple{Int4Type, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            category_id
            name
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        category_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(CategoryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(CategoryRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{CategoryRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{CategoryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(CategoryRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_category() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(CategoryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_category(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(CategoryRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::CategoryRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.category_id, SQLCompose.nextalias(alias, :category_id), i)
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::CategoryRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            CategoryRow(SQLCompose.mapfields(f, result.category_id, SQLCompose.nextalias(alias, :category_id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::CategoryRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.category_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.name, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct CityRow <: SQLCompose.RowStruct{SQLCompose.RowType{:city, (:city_id, :city, :country_id, :last_update), Tuple{Int4Type, TextType, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            city_id
            city
            country_id
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        city_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(CityRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(CityRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{CityRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{CityRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(CityRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_city() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(CityRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_city(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(CityRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::CityRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.city_id, SQLCompose.nextalias(alias, :city_id), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.country_id, SQLCompose.nextalias(alias, :country_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::CityRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            CityRow(SQLCompose.mapfields(f, result.city_id, SQLCompose.nextalias(alias, :city_id)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.country_id, SQLCompose.nextalias(alias, :country_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::CityRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.city_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.city, tableitem)
            SQLCompose.writelateralplan!(plan, node.country_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct CountryRow <: SQLCompose.RowStruct{SQLCompose.RowType{:country, (:country_id, :country, :last_update), Tuple{Int4Type, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            country_id
            country
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        country_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(CountryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(CountryRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{CountryRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{CountryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(CountryRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_country() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(CountryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_country(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(CountryRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::CountryRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.country_id, SQLCompose.nextalias(alias, :country_id), i)
                i = SQLCompose.foreachfield(f, result.country, SQLCompose.nextalias(alias, :country), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::CountryRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            CountryRow(SQLCompose.mapfields(f, result.country_id, SQLCompose.nextalias(alias, :country_id)), SQLCompose.mapfields(f, result.country, SQLCompose.nextalias(alias, :country)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::CountryRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.country_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.country, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct CustomerRow <: SQLCompose.RowStruct{SQLCompose.RowType{:customer, (:customer_id, :store_id, :first_name, :last_name, :email, :address_id, :activebool, :create_date, :last_update, :active), Tuple{Int4Type, Int4Type, TextType, TextType, TextType, Int4Type, BooleanType, SQLCompose.DateType, SQLCompose.TimestampType, Int4Type}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            customer_id
            store_id
            first_name
            last_name
            email
            address_id
            activebool
            create_date
            last_update
            active
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        customer_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(CustomerRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(CustomerRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{CustomerRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{CustomerRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(CustomerRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_customer() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(CustomerRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_customer(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(CustomerRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::CustomerRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id), i)
                i = SQLCompose.foreachfield(f, result.store_id, SQLCompose.nextalias(alias, :store_id), i)
                i = SQLCompose.foreachfield(f, result.first_name, SQLCompose.nextalias(alias, :first_name), i)
                i = SQLCompose.foreachfield(f, result.last_name, SQLCompose.nextalias(alias, :last_name), i)
                i = SQLCompose.foreachfield(f, result.email, SQLCompose.nextalias(alias, :email), i)
                i = SQLCompose.foreachfield(f, result.address_id, SQLCompose.nextalias(alias, :address_id), i)
                i = SQLCompose.foreachfield(f, result.activebool, SQLCompose.nextalias(alias, :activebool), i)
                i = SQLCompose.foreachfield(f, result.create_date, SQLCompose.nextalias(alias, :create_date), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
                i = SQLCompose.foreachfield(f, result.active, SQLCompose.nextalias(alias, :active), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::CustomerRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            CustomerRow(SQLCompose.mapfields(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id)), SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.email, SQLCompose.nextalias(alias, :email)), SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.activebool, SQLCompose.nextalias(alias, :activebool)), SQLCompose.mapfields(f, result.create_date, SQLCompose.nextalias(alias, :create_date)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.active, SQLCompose.nextalias(alias, :active)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::CustomerRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.customer_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.store_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.first_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.email, tableitem)
            SQLCompose.writelateralplan!(plan, node.address_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.activebool, tableitem)
            SQLCompose.writelateralplan!(plan, node.create_date, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
            SQLCompose.writelateralplan!(plan, node.active, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Customer_ListRow <: SQLCompose.RowStruct{SQLCompose.RowType{:customer_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :notes, :sid), Tuple{Int4Type, TextType, TextType, TextType, TextType, TextType, TextType, TextType, Int4Type}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            id
            name
            address
            var"zip code"
            phone
            city
            country
            notes
            sid
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        customer_list_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Customer_ListRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Customer_ListRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Customer_ListRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Customer_ListRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Customer_ListRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_customer_list() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Customer_ListRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_customer_list(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Customer_ListRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Customer_ListRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.id, SQLCompose.nextalias(alias, :id), i)
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.address, SQLCompose.nextalias(alias, :address), i)
                i = SQLCompose.foreachfield(f, result.var"zip code", SQLCompose.nextalias(alias, Symbol("zip code")), i)
                i = SQLCompose.foreachfield(f, result.phone, SQLCompose.nextalias(alias, :phone), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.country, SQLCompose.nextalias(alias, :country), i)
                i = SQLCompose.foreachfield(f, result.notes, SQLCompose.nextalias(alias, :notes), i)
                i = SQLCompose.foreachfield(f, result.sid, SQLCompose.nextalias(alias, :sid), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Customer_ListRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Customer_ListRow(SQLCompose.mapfields(f, result.id, SQLCompose.nextalias(alias, :id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.address, SQLCompose.nextalias(alias, :address)), SQLCompose.mapfields(f, result.var"zip code", SQLCompose.nextalias(alias, Symbol("zip code"))), SQLCompose.mapfields(f, result.phone, SQLCompose.nextalias(alias, :phone)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.country, SQLCompose.nextalias(alias, :country)), SQLCompose.mapfields(f, result.notes, SQLCompose.nextalias(alias, :notes)), SQLCompose.mapfields(f, result.sid, SQLCompose.nextalias(alias, :sid)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Customer_ListRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.id, tableitem)
            SQLCompose.writelateralplan!(plan, node.name, tableitem)
            SQLCompose.writelateralplan!(plan, node.address, tableitem)
            SQLCompose.writelateralplan!(plan, node.var"zip code", tableitem)
            SQLCompose.writelateralplan!(plan, node.phone, tableitem)
            SQLCompose.writelateralplan!(plan, node.city, tableitem)
            SQLCompose.writelateralplan!(plan, node.country, tableitem)
            SQLCompose.writelateralplan!(plan, node.notes, tableitem)
            SQLCompose.writelateralplan!(plan, node.sid, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct FilmRow <: SQLCompose.RowStruct{SQLCompose.RowType{:film, (:film_id, :title, :description, :release_year, :language_id, :original_language_id, :rental_duration, :rental_rate, :length, :replacement_cost, :rating, :last_update, :special_features, :fulltext), Tuple{Int4Type, TextType, TextType, Int4Type, Int4Type, Int4Type, Int2Type, SQLCompose.DecimalType, Int2Type, SQLCompose.DecimalType, EnumType, SQLCompose.TimestampType, SQLCompose.ArrayType{TextType}, SQLCompose.UnknownType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            film_id
            title
            description
            release_year
            language_id
            original_language_id
            rental_duration
            rental_rate
            length
            replacement_cost
            rating
            last_update
            special_features
            fulltext
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        film_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(FilmRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(FilmRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{FilmRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{FilmRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(FilmRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_film() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(FilmRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_film(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(FilmRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::FilmRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.title, SQLCompose.nextalias(alias, :title), i)
                i = SQLCompose.foreachfield(f, result.description, SQLCompose.nextalias(alias, :description), i)
                i = SQLCompose.foreachfield(f, result.release_year, SQLCompose.nextalias(alias, :release_year), i)
                i = SQLCompose.foreachfield(f, result.language_id, SQLCompose.nextalias(alias, :language_id), i)
                i = SQLCompose.foreachfield(f, result.original_language_id, SQLCompose.nextalias(alias, :original_language_id), i)
                i = SQLCompose.foreachfield(f, result.rental_duration, SQLCompose.nextalias(alias, :rental_duration), i)
                i = SQLCompose.foreachfield(f, result.rental_rate, SQLCompose.nextalias(alias, :rental_rate), i)
                i = SQLCompose.foreachfield(f, result.length, SQLCompose.nextalias(alias, :length), i)
                i = SQLCompose.foreachfield(f, result.replacement_cost, SQLCompose.nextalias(alias, :replacement_cost), i)
                i = SQLCompose.foreachfield(f, result.rating, SQLCompose.nextalias(alias, :rating), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
                i = SQLCompose.foreachfield(f, result.special_features, SQLCompose.nextalias(alias, :special_features), i)
                i = SQLCompose.foreachfield(f, result.fulltext, SQLCompose.nextalias(alias, :fulltext), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::FilmRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            FilmRow(SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.title, SQLCompose.nextalias(alias, :title)), SQLCompose.mapfields(f, result.description, SQLCompose.nextalias(alias, :description)), SQLCompose.mapfields(f, result.release_year, SQLCompose.nextalias(alias, :release_year)), SQLCompose.mapfields(f, result.language_id, SQLCompose.nextalias(alias, :language_id)), SQLCompose.mapfields(f, result.original_language_id, SQLCompose.nextalias(alias, :original_language_id)), SQLCompose.mapfields(f, result.rental_duration, SQLCompose.nextalias(alias, :rental_duration)), SQLCompose.mapfields(f, result.rental_rate, SQLCompose.nextalias(alias, :rental_rate)), SQLCompose.mapfields(f, result.length, SQLCompose.nextalias(alias, :length)), SQLCompose.mapfields(f, result.replacement_cost, SQLCompose.nextalias(alias, :replacement_cost)), SQLCompose.mapfields(f, result.rating, SQLCompose.nextalias(alias, :rating)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.special_features, SQLCompose.nextalias(alias, :special_features)), SQLCompose.mapfields(f, result.fulltext, SQLCompose.nextalias(alias, :fulltext)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::FilmRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.film_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.title, tableitem)
            SQLCompose.writelateralplan!(plan, node.description, tableitem)
            SQLCompose.writelateralplan!(plan, node.release_year, tableitem)
            SQLCompose.writelateralplan!(plan, node.language_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.original_language_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.rental_duration, tableitem)
            SQLCompose.writelateralplan!(plan, node.rental_rate, tableitem)
            SQLCompose.writelateralplan!(plan, node.length, tableitem)
            SQLCompose.writelateralplan!(plan, node.replacement_cost, tableitem)
            SQLCompose.writelateralplan!(plan, node.rating, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
            SQLCompose.writelateralplan!(plan, node.special_features, tableitem)
            SQLCompose.writelateralplan!(plan, node.fulltext, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Film_ActorRow <: SQLCompose.RowStruct{SQLCompose.RowType{:film_actor, (:actor_id, :film_id, :last_update), Tuple{Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            actor_id
            film_id
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        film_actor_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Film_ActorRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Film_ActorRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Film_ActorRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Film_ActorRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Film_ActorRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_film_actor() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Film_ActorRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_film_actor(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Film_ActorRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Film_ActorRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Film_ActorRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Film_ActorRow(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Film_ActorRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.actor_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.film_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Film_Actor_ExtensionRow <: SQLCompose.RowStruct{SQLCompose.RowType{:film_actor_extension, (:actor_id, :film_id), Tuple{Int4Type, Int4Type}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            actor_id
            film_id
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        film_actor_extension_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Film_Actor_ExtensionRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Film_Actor_ExtensionRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Film_Actor_ExtensionRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Film_Actor_ExtensionRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Film_Actor_ExtensionRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_film_actor_extension() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Film_Actor_ExtensionRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_film_actor_extension(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Film_Actor_ExtensionRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Film_Actor_ExtensionRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Film_Actor_ExtensionRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Film_Actor_ExtensionRow(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Film_Actor_ExtensionRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.actor_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.film_id, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Film_Actor_Extension2Row <: SQLCompose.RowStruct{SQLCompose.RowType{:film_actor_extension2, (:actor_id, :film_id), Tuple{Int4Type, Int4Type}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            actor_id
            film_id
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        film_actor_extension2_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Film_Actor_Extension2Row)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Film_Actor_Extension2Row)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Film_Actor_Extension2Row}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Film_Actor_Extension2Row}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Film_Actor_Extension2Row), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_film_actor_extension2() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Film_Actor_Extension2Row)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_film_actor_extension2(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Film_Actor_Extension2Row, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Film_Actor_Extension2Row, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Film_Actor_Extension2Row, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Film_Actor_Extension2Row(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Film_Actor_Extension2Row, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.actor_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.film_id, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Film_CategoryRow <: SQLCompose.RowStruct{SQLCompose.RowType{:film_category, (:film_id, :category_id, :last_update), Tuple{Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            film_id
            category_id
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        film_category_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Film_CategoryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Film_CategoryRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Film_CategoryRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Film_CategoryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Film_CategoryRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_film_category() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Film_CategoryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_film_category(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Film_CategoryRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Film_CategoryRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.category_id, SQLCompose.nextalias(alias, :category_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Film_CategoryRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Film_CategoryRow(SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.category_id, SQLCompose.nextalias(alias, :category_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Film_CategoryRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.film_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.category_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Film_ListRow <: SQLCompose.RowStruct{SQLCompose.RowType{:film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, TextType, TextType, TextType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            fid
            title
            description
            category
            price
            length
            rating
            actors
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        film_list_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Film_ListRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Film_ListRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Film_ListRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Film_ListRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Film_ListRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_film_list() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Film_ListRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_film_list(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Film_ListRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Film_ListRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.fid, SQLCompose.nextalias(alias, :fid), i)
                i = SQLCompose.foreachfield(f, result.title, SQLCompose.nextalias(alias, :title), i)
                i = SQLCompose.foreachfield(f, result.description, SQLCompose.nextalias(alias, :description), i)
                i = SQLCompose.foreachfield(f, result.category, SQLCompose.nextalias(alias, :category), i)
                i = SQLCompose.foreachfield(f, result.price, SQLCompose.nextalias(alias, :price), i)
                i = SQLCompose.foreachfield(f, result.length, SQLCompose.nextalias(alias, :length), i)
                i = SQLCompose.foreachfield(f, result.rating, SQLCompose.nextalias(alias, :rating), i)
                i = SQLCompose.foreachfield(f, result.actors, SQLCompose.nextalias(alias, :actors), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Film_ListRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Film_ListRow(SQLCompose.mapfields(f, result.fid, SQLCompose.nextalias(alias, :fid)), SQLCompose.mapfields(f, result.title, SQLCompose.nextalias(alias, :title)), SQLCompose.mapfields(f, result.description, SQLCompose.nextalias(alias, :description)), SQLCompose.mapfields(f, result.category, SQLCompose.nextalias(alias, :category)), SQLCompose.mapfields(f, result.price, SQLCompose.nextalias(alias, :price)), SQLCompose.mapfields(f, result.length, SQLCompose.nextalias(alias, :length)), SQLCompose.mapfields(f, result.rating, SQLCompose.nextalias(alias, :rating)), SQLCompose.mapfields(f, result.actors, SQLCompose.nextalias(alias, :actors)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Film_ListRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.fid, tableitem)
            SQLCompose.writelateralplan!(plan, node.title, tableitem)
            SQLCompose.writelateralplan!(plan, node.description, tableitem)
            SQLCompose.writelateralplan!(plan, node.category, tableitem)
            SQLCompose.writelateralplan!(plan, node.price, tableitem)
            SQLCompose.writelateralplan!(plan, node.length, tableitem)
            SQLCompose.writelateralplan!(plan, node.rating, tableitem)
            SQLCompose.writelateralplan!(plan, node.actors, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct InventoryRow <: SQLCompose.RowStruct{SQLCompose.RowType{:inventory, (:inventory_id, :film_id, :store_id, :last_update), Tuple{Int4Type, Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            inventory_id
            film_id
            store_id
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        inventory_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(InventoryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(InventoryRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{InventoryRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{InventoryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(InventoryRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_inventory() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(InventoryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_inventory(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(InventoryRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::InventoryRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.store_id, SQLCompose.nextalias(alias, :store_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::InventoryRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            InventoryRow(SQLCompose.mapfields(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::InventoryRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.inventory_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.film_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.store_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Inventory_ItemRow <: SQLCompose.RowStruct{SQLCompose.RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            name
            supplier_id
            price
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        inventory_item_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Inventory_ItemRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Inventory_ItemRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Inventory_ItemRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Inventory_ItemRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Inventory_ItemRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_inventory_item() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Inventory_ItemRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_inventory_item(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Inventory_ItemRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_ItemRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_id, SQLCompose.nextalias(alias, :supplier_id), i)
                i = SQLCompose.foreachfield(f, result.price, SQLCompose.nextalias(alias, :price), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_ItemRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Inventory_ItemRow(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_id, SQLCompose.nextalias(alias, :supplier_id)), SQLCompose.mapfields(f, result.price, SQLCompose.nextalias(alias, :price)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Inventory_ItemRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.name, tableitem)
            SQLCompose.writelateralplan!(plan, node.supplier_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.price, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Inventory_Item2Row <: SQLCompose.RowStruct{SQLCompose.RowType{:inventory_item2, (:name, :supplier_ids, :prices), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            name
            supplier_ids
            prices
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        inventory_item2_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Inventory_Item2Row)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Inventory_Item2Row)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Inventory_Item2Row}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Inventory_Item2Row}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Inventory_Item2Row), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_inventory_item2() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Inventory_Item2Row)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_inventory_item2(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Inventory_Item2Row, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item2Row, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids), i)
                i = SQLCompose.foreachfield(f, result.prices, SQLCompose.nextalias(alias, :prices), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item2Row, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Inventory_Item2Row(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids)), SQLCompose.mapfields(f, result.prices, SQLCompose.nextalias(alias, :prices)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Inventory_Item2Row, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.name, tableitem)
            SQLCompose.writelateralplan!(plan, node.supplier_ids, tableitem)
            SQLCompose.writelateralplan!(plan, node.prices, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Inventory_Item3Row <: SQLCompose.RowStruct{SQLCompose.RowType{:inventory_item3, (:name, :supplier_ids, :prices, :dt, :item), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}, SQLCompose.TimestampType, SQLCompose.RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            name
            supplier_ids
            prices
            dt
            item
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        inventory_item3_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Inventory_Item3Row)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Inventory_Item3Row)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Inventory_Item3Row}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Inventory_Item3Row}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Inventory_Item3Row), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_inventory_item3() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Inventory_Item3Row)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_inventory_item3(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Inventory_Item3Row, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item3Row, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids), i)
                i = SQLCompose.foreachfield(f, result.prices, SQLCompose.nextalias(alias, :prices), i)
                i = SQLCompose.foreachfield(f, result.dt, SQLCompose.nextalias(alias, :dt), i)
                i = SQLCompose.foreachfield(f, result.item, SQLCompose.nextalias(alias, :item), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item3Row, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Inventory_Item3Row(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids)), SQLCompose.mapfields(f, result.prices, SQLCompose.nextalias(alias, :prices)), SQLCompose.mapfields(f, result.dt, SQLCompose.nextalias(alias, :dt)), SQLCompose.mapfields(f, result.item, SQLCompose.nextalias(alias, :item)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Inventory_Item3Row, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.name, tableitem)
            SQLCompose.writelateralplan!(plan, node.supplier_ids, tableitem)
            SQLCompose.writelateralplan!(plan, node.prices, tableitem)
            SQLCompose.writelateralplan!(plan, node.dt, tableitem)
            SQLCompose.writelateralplan!(plan, node.item, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Inventory_Item4Row <: SQLCompose.RowStruct{SQLCompose.RowType{:inventory_item4, (:name, :supplier_ids, :prices), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            name
            supplier_ids
            prices
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        inventory_item4_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Inventory_Item4Row)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Inventory_Item4Row)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Inventory_Item4Row}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Inventory_Item4Row}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Inventory_Item4Row), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_inventory_item4() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Inventory_Item4Row)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_inventory_item4(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Inventory_Item4Row, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item4Row, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids), i)
                i = SQLCompose.foreachfield(f, result.prices, SQLCompose.nextalias(alias, :prices), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item4Row, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Inventory_Item4Row(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids)), SQLCompose.mapfields(f, result.prices, SQLCompose.nextalias(alias, :prices)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Inventory_Item4Row, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.name, tableitem)
            SQLCompose.writelateralplan!(plan, node.supplier_ids, tableitem)
            SQLCompose.writelateralplan!(plan, node.prices, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct LanguageRow <: SQLCompose.RowStruct{SQLCompose.RowType{:language, (:language_id, :name, :last_update), Tuple{Int4Type, SQLCompose.CharType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            language_id
            name
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        language_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(LanguageRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(LanguageRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{LanguageRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{LanguageRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(LanguageRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_language() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(LanguageRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_language(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(LanguageRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::LanguageRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.language_id, SQLCompose.nextalias(alias, :language_id), i)
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::LanguageRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            LanguageRow(SQLCompose.mapfields(f, result.language_id, SQLCompose.nextalias(alias, :language_id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::LanguageRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.language_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.name, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Nicer_But_Slower_Film_ListRow <: SQLCompose.RowStruct{SQLCompose.RowType{:nicer_but_slower_film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, TextType, TextType, TextType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            fid
            title
            description
            category
            price
            length
            rating
            actors
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        nicer_but_slower_film_list_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Nicer_But_Slower_Film_ListRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Nicer_But_Slower_Film_ListRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Nicer_But_Slower_Film_ListRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Nicer_But_Slower_Film_ListRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Nicer_But_Slower_Film_ListRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_nicer_but_slower_film_list() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Nicer_But_Slower_Film_ListRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_nicer_but_slower_film_list(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Nicer_But_Slower_Film_ListRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Nicer_But_Slower_Film_ListRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.fid, SQLCompose.nextalias(alias, :fid), i)
                i = SQLCompose.foreachfield(f, result.title, SQLCompose.nextalias(alias, :title), i)
                i = SQLCompose.foreachfield(f, result.description, SQLCompose.nextalias(alias, :description), i)
                i = SQLCompose.foreachfield(f, result.category, SQLCompose.nextalias(alias, :category), i)
                i = SQLCompose.foreachfield(f, result.price, SQLCompose.nextalias(alias, :price), i)
                i = SQLCompose.foreachfield(f, result.length, SQLCompose.nextalias(alias, :length), i)
                i = SQLCompose.foreachfield(f, result.rating, SQLCompose.nextalias(alias, :rating), i)
                i = SQLCompose.foreachfield(f, result.actors, SQLCompose.nextalias(alias, :actors), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Nicer_But_Slower_Film_ListRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Nicer_But_Slower_Film_ListRow(SQLCompose.mapfields(f, result.fid, SQLCompose.nextalias(alias, :fid)), SQLCompose.mapfields(f, result.title, SQLCompose.nextalias(alias, :title)), SQLCompose.mapfields(f, result.description, SQLCompose.nextalias(alias, :description)), SQLCompose.mapfields(f, result.category, SQLCompose.nextalias(alias, :category)), SQLCompose.mapfields(f, result.price, SQLCompose.nextalias(alias, :price)), SQLCompose.mapfields(f, result.length, SQLCompose.nextalias(alias, :length)), SQLCompose.mapfields(f, result.rating, SQLCompose.nextalias(alias, :rating)), SQLCompose.mapfields(f, result.actors, SQLCompose.nextalias(alias, :actors)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Nicer_But_Slower_Film_ListRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.fid, tableitem)
            SQLCompose.writelateralplan!(plan, node.title, tableitem)
            SQLCompose.writelateralplan!(plan, node.description, tableitem)
            SQLCompose.writelateralplan!(plan, node.category, tableitem)
            SQLCompose.writelateralplan!(plan, node.price, tableitem)
            SQLCompose.writelateralplan!(plan, node.length, tableitem)
            SQLCompose.writelateralplan!(plan, node.rating, tableitem)
            SQLCompose.writelateralplan!(plan, node.actors, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct PaymentRow <: SQLCompose.RowStruct{SQLCompose.RowType{:payment, (:payment_id, :customer_id, :staff_id, :rental_id, :amount, :payment_date), Tuple{Int4Type, Int4Type, Int4Type, Int4Type, SQLCompose.DecimalType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            payment_id
            customer_id
            staff_id
            rental_id
            amount
            payment_date
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        payment_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(PaymentRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(PaymentRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{PaymentRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{PaymentRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(PaymentRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_payment() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(PaymentRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_payment(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(PaymentRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::PaymentRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.payment_id, SQLCompose.nextalias(alias, :payment_id), i)
                i = SQLCompose.foreachfield(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id), i)
                i = SQLCompose.foreachfield(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id), i)
                i = SQLCompose.foreachfield(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id), i)
                i = SQLCompose.foreachfield(f, result.amount, SQLCompose.nextalias(alias, :amount), i)
                i = SQLCompose.foreachfield(f, result.payment_date, SQLCompose.nextalias(alias, :payment_date), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::PaymentRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            PaymentRow(SQLCompose.mapfields(f, result.payment_id, SQLCompose.nextalias(alias, :payment_id)), SQLCompose.mapfields(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id)), SQLCompose.mapfields(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id)), SQLCompose.mapfields(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id)), SQLCompose.mapfields(f, result.amount, SQLCompose.nextalias(alias, :amount)), SQLCompose.mapfields(f, result.payment_date, SQLCompose.nextalias(alias, :payment_date)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::PaymentRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.payment_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.customer_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.staff_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.rental_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.amount, tableitem)
            SQLCompose.writelateralplan!(plan, node.payment_date, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct RentalRow <: SQLCompose.RowStruct{SQLCompose.RowType{:rental, (:rental_id, :rental_date, :inventory_id, :customer_id, :return_date, :staff_id, :last_update), Tuple{Int4Type, SQLCompose.TimestampType, Int4Type, Int4Type, SQLCompose.TimestampType, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            rental_id
            rental_date
            inventory_id
            customer_id
            return_date
            staff_id
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        rental_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(RentalRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(RentalRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{RentalRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{RentalRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(RentalRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_rental() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(RentalRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_rental(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(RentalRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::RentalRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id), i)
                i = SQLCompose.foreachfield(f, result.rental_date, SQLCompose.nextalias(alias, :rental_date), i)
                i = SQLCompose.foreachfield(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id), i)
                i = SQLCompose.foreachfield(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id), i)
                i = SQLCompose.foreachfield(f, result.return_date, SQLCompose.nextalias(alias, :return_date), i)
                i = SQLCompose.foreachfield(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::RentalRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            RentalRow(SQLCompose.mapfields(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id)), SQLCompose.mapfields(f, result.rental_date, SQLCompose.nextalias(alias, :rental_date)), SQLCompose.mapfields(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id)), SQLCompose.mapfields(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id)), SQLCompose.mapfields(f, result.return_date, SQLCompose.nextalias(alias, :return_date)), SQLCompose.mapfields(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::RentalRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.rental_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.rental_date, tableitem)
            SQLCompose.writelateralplan!(plan, node.inventory_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.customer_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.return_date, tableitem)
            SQLCompose.writelateralplan!(plan, node.staff_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Sales_By_Film_CategoryRow <: SQLCompose.RowStruct{SQLCompose.RowType{:sales_by_film_category, (:category, :total_sales), Tuple{TextType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            category
            total_sales
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        sales_by_film_category_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Sales_By_Film_CategoryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Sales_By_Film_CategoryRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Sales_By_Film_CategoryRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Sales_By_Film_CategoryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Sales_By_Film_CategoryRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_sales_by_film_category() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Sales_By_Film_CategoryRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_sales_by_film_category(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Sales_By_Film_CategoryRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Sales_By_Film_CategoryRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.category, SQLCompose.nextalias(alias, :category), i)
                i = SQLCompose.foreachfield(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Sales_By_Film_CategoryRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Sales_By_Film_CategoryRow(SQLCompose.mapfields(f, result.category, SQLCompose.nextalias(alias, :category)), SQLCompose.mapfields(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Sales_By_Film_CategoryRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.category, tableitem)
            SQLCompose.writelateralplan!(plan, node.total_sales, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Sales_By_StoreRow <: SQLCompose.RowStruct{SQLCompose.RowType{:sales_by_store, (:store, :manager, :total_sales), Tuple{TextType, TextType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            store
            manager
            total_sales
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        sales_by_store_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Sales_By_StoreRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Sales_By_StoreRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Sales_By_StoreRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Sales_By_StoreRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Sales_By_StoreRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_sales_by_store() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Sales_By_StoreRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_sales_by_store(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Sales_By_StoreRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Sales_By_StoreRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.store, SQLCompose.nextalias(alias, :store), i)
                i = SQLCompose.foreachfield(f, result.manager, SQLCompose.nextalias(alias, :manager), i)
                i = SQLCompose.foreachfield(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Sales_By_StoreRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Sales_By_StoreRow(SQLCompose.mapfields(f, result.store, SQLCompose.nextalias(alias, :store)), SQLCompose.mapfields(f, result.manager, SQLCompose.nextalias(alias, :manager)), SQLCompose.mapfields(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Sales_By_StoreRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.store, tableitem)
            SQLCompose.writelateralplan!(plan, node.manager, tableitem)
            SQLCompose.writelateralplan!(plan, node.total_sales, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct StaffRow <: SQLCompose.RowStruct{SQLCompose.RowType{:staff, (:staff_id, :first_name, :last_name, :address_id, :email, :store_id, :active, :username, :password, :last_update, :picture), Tuple{Int4Type, TextType, TextType, Int4Type, TextType, Int4Type, BooleanType, TextType, TextType, SQLCompose.TimestampType, SQLCompose.BlobType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            staff_id
            first_name
            last_name
            address_id
            email
            store_id
            active
            username
            password
            last_update
            picture
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        staff_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(StaffRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(StaffRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{StaffRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{StaffRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(StaffRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_staff() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(StaffRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_staff(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(StaffRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::StaffRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id), i)
                i = SQLCompose.foreachfield(f, result.first_name, SQLCompose.nextalias(alias, :first_name), i)
                i = SQLCompose.foreachfield(f, result.last_name, SQLCompose.nextalias(alias, :last_name), i)
                i = SQLCompose.foreachfield(f, result.address_id, SQLCompose.nextalias(alias, :address_id), i)
                i = SQLCompose.foreachfield(f, result.email, SQLCompose.nextalias(alias, :email), i)
                i = SQLCompose.foreachfield(f, result.store_id, SQLCompose.nextalias(alias, :store_id), i)
                i = SQLCompose.foreachfield(f, result.active, SQLCompose.nextalias(alias, :active), i)
                i = SQLCompose.foreachfield(f, result.username, SQLCompose.nextalias(alias, :username), i)
                i = SQLCompose.foreachfield(f, result.password, SQLCompose.nextalias(alias, :password), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
                i = SQLCompose.foreachfield(f, result.picture, SQLCompose.nextalias(alias, :picture), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::StaffRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            StaffRow(SQLCompose.mapfields(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.email, SQLCompose.nextalias(alias, :email)), SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.active, SQLCompose.nextalias(alias, :active)), SQLCompose.mapfields(f, result.username, SQLCompose.nextalias(alias, :username)), SQLCompose.mapfields(f, result.password, SQLCompose.nextalias(alias, :password)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.picture, SQLCompose.nextalias(alias, :picture)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::StaffRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.staff_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.first_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_name, tableitem)
            SQLCompose.writelateralplan!(plan, node.address_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.email, tableitem)
            SQLCompose.writelateralplan!(plan, node.store_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.active, tableitem)
            SQLCompose.writelateralplan!(plan, node.username, tableitem)
            SQLCompose.writelateralplan!(plan, node.password, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
            SQLCompose.writelateralplan!(plan, node.picture, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct Staff_ListRow <: SQLCompose.RowStruct{SQLCompose.RowType{:staff_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :sid), Tuple{Int4Type, TextType, TextType, TextType, TextType, TextType, TextType, Int4Type}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            id
            name
            address
            var"zip code"
            phone
            city
            country
            sid
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        staff_list_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(Staff_ListRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(Staff_ListRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{Staff_ListRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{Staff_ListRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(Staff_ListRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_staff_list() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(Staff_ListRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_staff_list(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(Staff_ListRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::Staff_ListRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.id, SQLCompose.nextalias(alias, :id), i)
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.address, SQLCompose.nextalias(alias, :address), i)
                i = SQLCompose.foreachfield(f, result.var"zip code", SQLCompose.nextalias(alias, Symbol("zip code")), i)
                i = SQLCompose.foreachfield(f, result.phone, SQLCompose.nextalias(alias, :phone), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.country, SQLCompose.nextalias(alias, :country), i)
                i = SQLCompose.foreachfield(f, result.sid, SQLCompose.nextalias(alias, :sid), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::Staff_ListRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            Staff_ListRow(SQLCompose.mapfields(f, result.id, SQLCompose.nextalias(alias, :id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.address, SQLCompose.nextalias(alias, :address)), SQLCompose.mapfields(f, result.var"zip code", SQLCompose.nextalias(alias, Symbol("zip code"))), SQLCompose.mapfields(f, result.phone, SQLCompose.nextalias(alias, :phone)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.country, SQLCompose.nextalias(alias, :country)), SQLCompose.mapfields(f, result.sid, SQLCompose.nextalias(alias, :sid)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::Staff_ListRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.id, tableitem)
            SQLCompose.writelateralplan!(plan, node.name, tableitem)
            SQLCompose.writelateralplan!(plan, node.address, tableitem)
            SQLCompose.writelateralplan!(plan, node.var"zip code", tableitem)
            SQLCompose.writelateralplan!(plan, node.phone, tableitem)
            SQLCompose.writelateralplan!(plan, node.city, tableitem)
            SQLCompose.writelateralplan!(plan, node.country, tableitem)
            SQLCompose.writelateralplan!(plan, node.sid, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:93 =#
        struct StoreRow <: SQLCompose.RowStruct{SQLCompose.RowType{:store, (:store_id, :manager_staff_id, :address_id, :last_update), Tuple{Int4Type, Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:60 =#
            store_id
            manager_staff_id
            address_id
            last_update
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:94 =#
        store_table() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:69 =#
                SQLCompose.table(StoreRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:95 =#
        let q = SQLCompose.SelectQuery(StoreRow)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
            global SQLCompose.query(::Type{StoreRow}) = begin
                        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:64 =#
                        q
                    end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:96 =#
        SQLCompose.query(::Type{StoreRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:67 =#
                SQLCompose.QuerySet(query(StoreRow), executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:97 =#
        query_store() = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:71 =#
                query(StoreRow)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:98 =#
        query_store(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:72 =#
                query(StoreRow, executor)
            end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:99 =#
        function SQLCompose.foreachfield(f::Function, result::StoreRow, alias, index)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:75 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:76 =#
            let i = index
                #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:77 =#
                i = SQLCompose.foreachfield(f, result.store_id, SQLCompose.nextalias(alias, :store_id), i)
                i = SQLCompose.foreachfield(f, result.manager_staff_id, SQLCompose.nextalias(alias, :manager_staff_id), i)
                i = SQLCompose.foreachfield(f, result.address_id, SQLCompose.nextalias(alias, :address_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:100 =#
        function SQLCompose.mapfields(f::Function, result::StoreRow, alias)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:82 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:83 =#
            StoreRow(SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.manager_staff_id, SQLCompose.nextalias(alias, :manager_staff_id)), SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:101 =#
        function SQLCompose.writelateralplan!(plan, node::StoreRow, tableitem)
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:87 =#
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:88 =#
            SQLCompose.writelateralplan!(plan, node.store_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.manager_staff_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.address_id, tableitem)
            SQLCompose.writelateralplan!(plan, node.last_update, tableitem)
        end
    end
    #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:134 =#
    city_of(address::AddressRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(CityRow, (:city_id,), (address.city_id,))
        end
    country_of(city::CityRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(CountryRow, (:country_id,), (city.country_id,))
        end
    store_of(customer::CustomerRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(StoreRow, (:store_id,), (customer.store_id,))
        end
    address_of(customer::CustomerRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(AddressRow, (:address_id,), (customer.address_id,))
        end
    language_of(film::FilmRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(LanguageRow, (:language_id,), (film.language_id,))
        end
    original_language_of(film::FilmRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(LanguageRow, (:language_id,), (film.original_language_id,))
        end
    actor_of(film_actor::Film_ActorRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(ActorRow, (:actor_id,), (film_actor.actor_id,))
        end
    film_of(film_actor::Film_ActorRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(FilmRow, (:film_id,), (film_actor.film_id,))
        end
    actor_of(film_actor_extension::Film_Actor_ExtensionRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(ActorRow, (:actor_id,), (film_actor_extension.actor_id,))
        end
    actor_film_of(film_actor_extension2::Film_Actor_Extension2Row) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(Film_ActorRow, (:film_id, :actor_id), (film_actor_extension2.actor_id, film_actor_extension2.film_id))
        end
    actor_of(film_actor_extension2::Film_Actor_Extension2Row) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(ActorRow, (:actor_id,), (film_actor_extension2.actor_id,))
        end
    film_of(film_actor_extension2::Film_Actor_Extension2Row) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(ActorRow, (:actor_id,), (film_actor_extension2.film_id,))
        end
    category_of(film_category::Film_CategoryRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(CategoryRow, (:category_id,), (film_category.category_id,))
        end
    film_of(film_category::Film_CategoryRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(FilmRow, (:film_id,), (film_category.film_id,))
        end
    film_of(inventory::InventoryRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(FilmRow, (:film_id,), (inventory.film_id,))
        end
    store_of(inventory::InventoryRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(StoreRow, (:store_id,), (inventory.store_id,))
        end
    customer_of(rental::RentalRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(CustomerRow, (:customer_id,), (rental.customer_id,))
        end
    inventory_of(rental::RentalRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(InventoryRow, (:inventory_id,), (rental.inventory_id,))
        end
    staff_of(rental::RentalRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(StaffRow, (:staff_id,), (rental.staff_id,))
        end
    address_of(staff::StaffRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(AddressRow, (:address_id,), (staff.address_id,))
        end
    store_of(staff::StaffRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(StoreRow, (:store_id,), (staff.store_id,))
        end
    address_of(store::StoreRow) = begin
            #= c:\Users\Rob\Projects\SQLCompose.jl\src\generate\generate.jl:114 =#
            SQLCompose.lateral(AddressRow, (:address_id,), (store.address_id,))
        end
end
end