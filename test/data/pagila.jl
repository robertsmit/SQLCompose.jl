module Pagila
#= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:14 =#
#= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:15 =#
using SQLCompose
#= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:16 =#
begin
    #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:144 =#
    export ActorRow, Actor_InfoRow, AddressRow, CategoryRow, CityRow, CountryRow, CustomerRow, Customer_ListRow, FilmRow, Film_ActorRow, Film_Actor_ExtensionRow, Film_Actor_Extension2Row, Film_CategoryRow, Film_ListRow, InventoryRow, Inventory_ItemRow, Inventory_Item2Row, Inventory_Item3Row, Inventory_Item4Row, LanguageRow, Nicer_But_Slower_Film_ListRow, PaymentRow, RentalRow, Sales_By_Film_CategoryRow, Sales_By_StoreRow, StaffRow, Staff_ListRow, StoreRow
    export city_of, country_of, store_of, address_of, language_of, original_language_of, actor_of, film_of, actor_of, actor_film_of, actor_of, film_of, category_of, film_of, film_of, store_of, customer_of, inventory_of, staff_of, address_of, store_of, address_of
    export all_address_of, all_city_of, all_customer_of, all_customer_of, all_film_of, all_original_language_of, all_film_actor_of, all_film_actor_of, all_film_actor_extension_of, all_actor_film_of, all_film_actor_extension2_of, all_film_of, all_film_category_of, all_film_category_of, all_inventory_of, all_inventory_of, all_rental_of, all_rental_of, all_rental_of, all_staff_of, all_staff_of, all_store_of
    export actor_table, actor_info_table, address_table, category_table, city_table, country_table, customer_table, customer_list_table, film_table, film_actor_table, film_actor_extension_table, film_actor_extension2_table, film_category_table, film_list_table, inventory_table, inventory_item_table, inventory_item2_table, inventory_item3_table, inventory_item4_table, language_table, nicer_but_slower_film_list_table, payment_table, rental_table, sales_by_film_category_table, sales_by_store_table, staff_table, staff_list_table, store_table
    export query_actor, query_actor_info, query_address, query_category, query_city, query_country, query_customer, query_customer_list, query_film, query_film_actor, query_film_actor_extension, query_film_actor_extension2, query_film_category, query_film_list, query_inventory, query_inventory_item, query_inventory_item2, query_inventory_item3, query_inventory_item4, query_language, query_nicer_but_slower_film_list, query_payment, query_rental, query_sales_by_film_category, query_sales_by_store, query_staff, query_staff_list, query_store
    #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:145 =#
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct ActorRow <: SQLCompose.RowStruct{RowType{:actor, (:actor_id, :first_name, :last_name, :last_update), Tuple{Int4Type, TextType, TextType, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            actor_id
            first_name
            last_name
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        actor_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(ActorRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(ActorRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{ActorRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{ActorRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(ActorRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_actor() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(ActorRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_actor(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(ActorRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::ActorRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.first_name, SQLCompose.nextalias(alias, :first_name), i)
                i = SQLCompose.foreachfield(f, result.last_name, SQLCompose.nextalias(alias, :last_name), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::ActorRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            ActorRow(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::ActorRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.first_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Actor_InfoRow <: SQLCompose.RowStruct{RowType{:actor_info, (:actor_id, :first_name, :last_name, :film_info), Tuple{Int4Type, TextType, TextType, TextType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            actor_id
            first_name
            last_name
            film_info
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        actor_info_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Actor_InfoRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Actor_InfoRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Actor_InfoRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Actor_InfoRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Actor_InfoRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_actor_info() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Actor_InfoRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_actor_info(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Actor_InfoRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Actor_InfoRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.first_name, SQLCompose.nextalias(alias, :first_name), i)
                i = SQLCompose.foreachfield(f, result.last_name, SQLCompose.nextalias(alias, :last_name), i)
                i = SQLCompose.foreachfield(f, result.film_info, SQLCompose.nextalias(alias, :film_info), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Actor_InfoRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Actor_InfoRow(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.film_info, SQLCompose.nextalias(alias, :film_info)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Actor_InfoRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.first_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_info, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct AddressRow <: SQLCompose.RowStruct{RowType{:address, (:address_id, :address, :address2, :district, :city_id, :postal_code, :phone, :last_update), Tuple{Int4Type, TextType, TextType, TextType, Int4Type, TextType, TextType, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            address_id
            address
            address2
            district
            city_id
            postal_code
            phone
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        address_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(AddressRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(AddressRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{AddressRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{AddressRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(AddressRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_address() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(AddressRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_address(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(AddressRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::AddressRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::AddressRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            AddressRow(SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.address, SQLCompose.nextalias(alias, :address)), SQLCompose.mapfields(f, result.address2, SQLCompose.nextalias(alias, :address2)), SQLCompose.mapfields(f, result.district, SQLCompose.nextalias(alias, :district)), SQLCompose.mapfields(f, result.city_id, SQLCompose.nextalias(alias, :city_id)), SQLCompose.mapfields(f, result.postal_code, SQLCompose.nextalias(alias, :postal_code)), SQLCompose.mapfields(f, result.phone, SQLCompose.nextalias(alias, :phone)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::AddressRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.address_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.address, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.address2, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.district, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.postal_code, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.phone, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct CategoryRow <: SQLCompose.RowStruct{RowType{:category, (:category_id, :name, :last_update), Tuple{Int4Type, TextType, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            category_id
            name
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        category_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(CategoryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(CategoryRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{CategoryRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{CategoryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(CategoryRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_category() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(CategoryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_category(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(CategoryRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::CategoryRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.category_id, SQLCompose.nextalias(alias, :category_id), i)
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::CategoryRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            CategoryRow(SQLCompose.mapfields(f, result.category_id, SQLCompose.nextalias(alias, :category_id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::CategoryRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.category_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct CityRow <: SQLCompose.RowStruct{RowType{:city, (:city_id, :city, :country_id, :last_update), Tuple{Int4Type, TextType, Int4Type, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            city_id
            city
            country_id
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        city_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(CityRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(CityRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{CityRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{CityRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(CityRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_city() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(CityRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_city(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(CityRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::CityRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.city_id, SQLCompose.nextalias(alias, :city_id), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.country_id, SQLCompose.nextalias(alias, :country_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::CityRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            CityRow(SQLCompose.mapfields(f, result.city_id, SQLCompose.nextalias(alias, :city_id)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.country_id, SQLCompose.nextalias(alias, :country_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::CityRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.city_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.country_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct CountryRow <: SQLCompose.RowStruct{RowType{:country, (:country_id, :country, :last_update), Tuple{Int4Type, TextType, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            country_id
            country
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        country_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(CountryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(CountryRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{CountryRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{CountryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(CountryRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_country() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(CountryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_country(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(CountryRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::CountryRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.country_id, SQLCompose.nextalias(alias, :country_id), i)
                i = SQLCompose.foreachfield(f, result.country, SQLCompose.nextalias(alias, :country), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::CountryRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            CountryRow(SQLCompose.mapfields(f, result.country_id, SQLCompose.nextalias(alias, :country_id)), SQLCompose.mapfields(f, result.country, SQLCompose.nextalias(alias, :country)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::CountryRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.country_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.country, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct CustomerRow <: SQLCompose.RowStruct{RowType{:customer, (:customer_id, :store_id, :first_name, :last_name, :email, :address_id, :activebool, :create_date, :last_update, :active), Tuple{Int4Type, Int4Type, TextType, TextType, TextType, Int4Type, BooleanType, SQLCompose.DateType, SQLCompose.TimestampType, Int4Type}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        customer_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(CustomerRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(CustomerRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{CustomerRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{CustomerRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(CustomerRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_customer() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(CustomerRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_customer(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(CustomerRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::CustomerRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::CustomerRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            CustomerRow(SQLCompose.mapfields(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id)), SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.email, SQLCompose.nextalias(alias, :email)), SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.activebool, SQLCompose.nextalias(alias, :activebool)), SQLCompose.mapfields(f, result.create_date, SQLCompose.nextalias(alias, :create_date)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.active, SQLCompose.nextalias(alias, :active)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::CustomerRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.customer_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.store_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.first_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.email, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.address_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.activebool, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.create_date, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.active, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Customer_ListRow <: SQLCompose.RowStruct{RowType{:customer_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :notes, :sid), Tuple{Int4Type, TextType, TextType, TextType, TextType, TextType, TextType, TextType, Int4Type}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        customer_list_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Customer_ListRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Customer_ListRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Customer_ListRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Customer_ListRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Customer_ListRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_customer_list() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Customer_ListRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_customer_list(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Customer_ListRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Customer_ListRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Customer_ListRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Customer_ListRow(SQLCompose.mapfields(f, result.id, SQLCompose.nextalias(alias, :id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.address, SQLCompose.nextalias(alias, :address)), SQLCompose.mapfields(f, result.var"zip code", SQLCompose.nextalias(alias, Symbol("zip code"))), SQLCompose.mapfields(f, result.phone, SQLCompose.nextalias(alias, :phone)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.country, SQLCompose.nextalias(alias, :country)), SQLCompose.mapfields(f, result.notes, SQLCompose.nextalias(alias, :notes)), SQLCompose.mapfields(f, result.sid, SQLCompose.nextalias(alias, :sid)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Customer_ListRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.address, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.var"zip code", tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.phone, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.country, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.notes, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.sid, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct FilmRow <: SQLCompose.RowStruct{RowType{:film, (:film_id, :title, :description, :release_year, :language_id, :original_language_id, :rental_duration, :rental_rate, :length, :replacement_cost, :rating, :last_update, :special_features, :fulltext), Tuple{Int4Type, TextType, TextType, Int4Type, Int4Type, Int4Type, Int2Type, SQLCompose.DecimalType, Int2Type, SQLCompose.DecimalType, EnumType, SQLCompose.TimestampType, SQLCompose.ArrayType{TextType}, SQLCompose.UnknownType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        film_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(FilmRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(FilmRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{FilmRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{FilmRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(FilmRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_film() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(FilmRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_film(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(FilmRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::FilmRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::FilmRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            FilmRow(SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.title, SQLCompose.nextalias(alias, :title)), SQLCompose.mapfields(f, result.description, SQLCompose.nextalias(alias, :description)), SQLCompose.mapfields(f, result.release_year, SQLCompose.nextalias(alias, :release_year)), SQLCompose.mapfields(f, result.language_id, SQLCompose.nextalias(alias, :language_id)), SQLCompose.mapfields(f, result.original_language_id, SQLCompose.nextalias(alias, :original_language_id)), SQLCompose.mapfields(f, result.rental_duration, SQLCompose.nextalias(alias, :rental_duration)), SQLCompose.mapfields(f, result.rental_rate, SQLCompose.nextalias(alias, :rental_rate)), SQLCompose.mapfields(f, result.length, SQLCompose.nextalias(alias, :length)), SQLCompose.mapfields(f, result.replacement_cost, SQLCompose.nextalias(alias, :replacement_cost)), SQLCompose.mapfields(f, result.rating, SQLCompose.nextalias(alias, :rating)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.special_features, SQLCompose.nextalias(alias, :special_features)), SQLCompose.mapfields(f, result.fulltext, SQLCompose.nextalias(alias, :fulltext)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::FilmRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.title, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.description, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.release_year, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.language_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.original_language_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.rental_duration, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.rental_rate, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.length, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.replacement_cost, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.rating, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.special_features, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.fulltext, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Film_ActorRow <: SQLCompose.RowStruct{RowType{:film_actor, (:actor_id, :film_id, :last_update), Tuple{Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            actor_id
            film_id
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        film_actor_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Film_ActorRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Film_ActorRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Film_ActorRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Film_ActorRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Film_ActorRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_film_actor() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Film_ActorRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_film_actor(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Film_ActorRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Film_ActorRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Film_ActorRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Film_ActorRow(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_ActorRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Film_Actor_ExtensionRow <: SQLCompose.RowStruct{RowType{:film_actor_extension, (:actor_id, :film_id), Tuple{Int4Type, Int4Type}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            actor_id
            film_id
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        film_actor_extension_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Film_Actor_ExtensionRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Film_Actor_ExtensionRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Film_Actor_ExtensionRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Film_Actor_ExtensionRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Film_Actor_ExtensionRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_film_actor_extension() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Film_Actor_ExtensionRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_film_actor_extension(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Film_Actor_ExtensionRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Film_Actor_ExtensionRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Film_Actor_ExtensionRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Film_Actor_ExtensionRow(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_Actor_ExtensionRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Film_Actor_Extension2Row <: SQLCompose.RowStruct{RowType{:film_actor_extension2, (:actor_id, :film_id), Tuple{Int4Type, Int4Type}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            actor_id
            film_id
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        film_actor_extension2_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Film_Actor_Extension2Row)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Film_Actor_Extension2Row)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Film_Actor_Extension2Row}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Film_Actor_Extension2Row}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Film_Actor_Extension2Row), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_film_actor_extension2() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Film_Actor_Extension2Row)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_film_actor_extension2(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Film_Actor_Extension2Row, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Film_Actor_Extension2Row, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Film_Actor_Extension2Row, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Film_Actor_Extension2Row(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_Actor_Extension2Row, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Film_CategoryRow <: SQLCompose.RowStruct{RowType{:film_category, (:film_id, :category_id, :last_update), Tuple{Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            film_id
            category_id
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        film_category_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Film_CategoryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Film_CategoryRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Film_CategoryRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Film_CategoryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Film_CategoryRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_film_category() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Film_CategoryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_film_category(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Film_CategoryRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Film_CategoryRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.category_id, SQLCompose.nextalias(alias, :category_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Film_CategoryRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Film_CategoryRow(SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.category_id, SQLCompose.nextalias(alias, :category_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_CategoryRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.category_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Film_ListRow <: SQLCompose.RowStruct{RowType{:film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, TextType, TextType, TextType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            fid
            title
            description
            category
            price
            length
            rating
            actors
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        film_list_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Film_ListRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Film_ListRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Film_ListRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Film_ListRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Film_ListRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_film_list() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Film_ListRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_film_list(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Film_ListRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Film_ListRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Film_ListRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Film_ListRow(SQLCompose.mapfields(f, result.fid, SQLCompose.nextalias(alias, :fid)), SQLCompose.mapfields(f, result.title, SQLCompose.nextalias(alias, :title)), SQLCompose.mapfields(f, result.description, SQLCompose.nextalias(alias, :description)), SQLCompose.mapfields(f, result.category, SQLCompose.nextalias(alias, :category)), SQLCompose.mapfields(f, result.price, SQLCompose.nextalias(alias, :price)), SQLCompose.mapfields(f, result.length, SQLCompose.nextalias(alias, :length)), SQLCompose.mapfields(f, result.rating, SQLCompose.nextalias(alias, :rating)), SQLCompose.mapfields(f, result.actors, SQLCompose.nextalias(alias, :actors)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_ListRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.fid, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.title, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.description, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.category, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.price, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.length, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.rating, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.actors, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct InventoryRow <: SQLCompose.RowStruct{RowType{:inventory, (:inventory_id, :film_id, :store_id, :last_update), Tuple{Int4Type, Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            inventory_id
            film_id
            store_id
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        inventory_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(InventoryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(InventoryRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{InventoryRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{InventoryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(InventoryRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_inventory() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(InventoryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_inventory(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(InventoryRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::InventoryRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.store_id, SQLCompose.nextalias(alias, :store_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::InventoryRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            InventoryRow(SQLCompose.mapfields(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::InventoryRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.inventory_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.store_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Inventory_ItemRow <: SQLCompose.RowStruct{RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            name
            supplier_id
            price
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        inventory_item_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Inventory_ItemRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Inventory_ItemRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Inventory_ItemRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Inventory_ItemRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Inventory_ItemRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_inventory_item() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Inventory_ItemRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_inventory_item(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Inventory_ItemRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_ItemRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_id, SQLCompose.nextalias(alias, :supplier_id), i)
                i = SQLCompose.foreachfield(f, result.price, SQLCompose.nextalias(alias, :price), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_ItemRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Inventory_ItemRow(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_id, SQLCompose.nextalias(alias, :supplier_id)), SQLCompose.mapfields(f, result.price, SQLCompose.nextalias(alias, :price)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Inventory_ItemRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.supplier_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.price, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Inventory_Item2Row <: SQLCompose.RowStruct{RowType{:inventory_item2, (:name, :supplier_ids, :prices), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            name
            supplier_ids
            prices
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        inventory_item2_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Inventory_Item2Row)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Inventory_Item2Row)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Inventory_Item2Row}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Inventory_Item2Row}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Inventory_Item2Row), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_inventory_item2() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Inventory_Item2Row)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_inventory_item2(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Inventory_Item2Row, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item2Row, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids), i)
                i = SQLCompose.foreachfield(f, result.prices, SQLCompose.nextalias(alias, :prices), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item2Row, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Inventory_Item2Row(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids)), SQLCompose.mapfields(f, result.prices, SQLCompose.nextalias(alias, :prices)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Inventory_Item2Row, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.supplier_ids, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.prices, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Inventory_Item3Row <: SQLCompose.RowStruct{RowType{:inventory_item3, (:name, :supplier_ids, :prices, :dt, :item), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}, SQLCompose.TimestampType, RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            name
            supplier_ids
            prices
            dt
            item
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        inventory_item3_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Inventory_Item3Row)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Inventory_Item3Row)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Inventory_Item3Row}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Inventory_Item3Row}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Inventory_Item3Row), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_inventory_item3() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Inventory_Item3Row)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_inventory_item3(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Inventory_Item3Row, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item3Row, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids), i)
                i = SQLCompose.foreachfield(f, result.prices, SQLCompose.nextalias(alias, :prices), i)
                i = SQLCompose.foreachfield(f, result.dt, SQLCompose.nextalias(alias, :dt), i)
                i = SQLCompose.foreachfield(f, result.item, SQLCompose.nextalias(alias, :item), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item3Row, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Inventory_Item3Row(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids)), SQLCompose.mapfields(f, result.prices, SQLCompose.nextalias(alias, :prices)), SQLCompose.mapfields(f, result.dt, SQLCompose.nextalias(alias, :dt)), SQLCompose.mapfields(f, result.item, SQLCompose.nextalias(alias, :item)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Inventory_Item3Row, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.supplier_ids, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.prices, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.dt, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.item, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Inventory_Item4Row <: SQLCompose.RowStruct{RowType{:inventory_item4, (:name, :supplier_ids, :prices), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            name
            supplier_ids
            prices
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        inventory_item4_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Inventory_Item4Row)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Inventory_Item4Row)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Inventory_Item4Row}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Inventory_Item4Row}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Inventory_Item4Row), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_inventory_item4() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Inventory_Item4Row)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_inventory_item4(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Inventory_Item4Row, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item4Row, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids), i)
                i = SQLCompose.foreachfield(f, result.prices, SQLCompose.nextalias(alias, :prices), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item4Row, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Inventory_Item4Row(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids)), SQLCompose.mapfields(f, result.prices, SQLCompose.nextalias(alias, :prices)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Inventory_Item4Row, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.supplier_ids, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.prices, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct LanguageRow <: SQLCompose.RowStruct{RowType{:language, (:language_id, :name, :last_update), Tuple{Int4Type, CharType, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            language_id
            name
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        language_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(LanguageRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(LanguageRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{LanguageRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{LanguageRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(LanguageRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_language() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(LanguageRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_language(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(LanguageRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::LanguageRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.language_id, SQLCompose.nextalias(alias, :language_id), i)
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::LanguageRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            LanguageRow(SQLCompose.mapfields(f, result.language_id, SQLCompose.nextalias(alias, :language_id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::LanguageRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.language_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Nicer_But_Slower_Film_ListRow <: SQLCompose.RowStruct{RowType{:nicer_but_slower_film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, TextType, TextType, TextType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            fid
            title
            description
            category
            price
            length
            rating
            actors
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        nicer_but_slower_film_list_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Nicer_But_Slower_Film_ListRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Nicer_But_Slower_Film_ListRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Nicer_But_Slower_Film_ListRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Nicer_But_Slower_Film_ListRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Nicer_But_Slower_Film_ListRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_nicer_but_slower_film_list() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Nicer_But_Slower_Film_ListRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_nicer_but_slower_film_list(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Nicer_But_Slower_Film_ListRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Nicer_But_Slower_Film_ListRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Nicer_But_Slower_Film_ListRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Nicer_But_Slower_Film_ListRow(SQLCompose.mapfields(f, result.fid, SQLCompose.nextalias(alias, :fid)), SQLCompose.mapfields(f, result.title, SQLCompose.nextalias(alias, :title)), SQLCompose.mapfields(f, result.description, SQLCompose.nextalias(alias, :description)), SQLCompose.mapfields(f, result.category, SQLCompose.nextalias(alias, :category)), SQLCompose.mapfields(f, result.price, SQLCompose.nextalias(alias, :price)), SQLCompose.mapfields(f, result.length, SQLCompose.nextalias(alias, :length)), SQLCompose.mapfields(f, result.rating, SQLCompose.nextalias(alias, :rating)), SQLCompose.mapfields(f, result.actors, SQLCompose.nextalias(alias, :actors)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Nicer_But_Slower_Film_ListRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.fid, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.title, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.description, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.category, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.price, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.length, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.rating, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.actors, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct PaymentRow <: SQLCompose.RowStruct{RowType{:payment, (:payment_id, :customer_id, :staff_id, :rental_id, :amount, :payment_date), Tuple{Int4Type, Int4Type, Int4Type, Int4Type, SQLCompose.DecimalType, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            payment_id
            customer_id
            staff_id
            rental_id
            amount
            payment_date
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        payment_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(PaymentRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(PaymentRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{PaymentRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{PaymentRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(PaymentRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_payment() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(PaymentRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_payment(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(PaymentRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::PaymentRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.payment_id, SQLCompose.nextalias(alias, :payment_id), i)
                i = SQLCompose.foreachfield(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id), i)
                i = SQLCompose.foreachfield(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id), i)
                i = SQLCompose.foreachfield(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id), i)
                i = SQLCompose.foreachfield(f, result.amount, SQLCompose.nextalias(alias, :amount), i)
                i = SQLCompose.foreachfield(f, result.payment_date, SQLCompose.nextalias(alias, :payment_date), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::PaymentRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            PaymentRow(SQLCompose.mapfields(f, result.payment_id, SQLCompose.nextalias(alias, :payment_id)), SQLCompose.mapfields(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id)), SQLCompose.mapfields(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id)), SQLCompose.mapfields(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id)), SQLCompose.mapfields(f, result.amount, SQLCompose.nextalias(alias, :amount)), SQLCompose.mapfields(f, result.payment_date, SQLCompose.nextalias(alias, :payment_date)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::PaymentRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.payment_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.customer_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.staff_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.rental_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.amount, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.payment_date, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct RentalRow <: SQLCompose.RowStruct{RowType{:rental, (:rental_id, :rental_date, :inventory_id, :customer_id, :return_date, :staff_id, :last_update), Tuple{Int4Type, SQLCompose.TimestampType, Int4Type, Int4Type, SQLCompose.TimestampType, Int4Type, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            rental_id
            rental_date
            inventory_id
            customer_id
            return_date
            staff_id
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        rental_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(RentalRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(RentalRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{RentalRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{RentalRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(RentalRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_rental() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(RentalRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_rental(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(RentalRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::RentalRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id), i)
                i = SQLCompose.foreachfield(f, result.rental_date, SQLCompose.nextalias(alias, :rental_date), i)
                i = SQLCompose.foreachfield(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id), i)
                i = SQLCompose.foreachfield(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id), i)
                i = SQLCompose.foreachfield(f, result.return_date, SQLCompose.nextalias(alias, :return_date), i)
                i = SQLCompose.foreachfield(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::RentalRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            RentalRow(SQLCompose.mapfields(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id)), SQLCompose.mapfields(f, result.rental_date, SQLCompose.nextalias(alias, :rental_date)), SQLCompose.mapfields(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id)), SQLCompose.mapfields(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id)), SQLCompose.mapfields(f, result.return_date, SQLCompose.nextalias(alias, :return_date)), SQLCompose.mapfields(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::RentalRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.rental_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.rental_date, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.inventory_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.customer_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.return_date, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.staff_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Sales_By_Film_CategoryRow <: SQLCompose.RowStruct{RowType{:sales_by_film_category, (:category, :total_sales), Tuple{TextType, SQLCompose.DecimalType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            category
            total_sales
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        sales_by_film_category_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Sales_By_Film_CategoryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Sales_By_Film_CategoryRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Sales_By_Film_CategoryRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Sales_By_Film_CategoryRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Sales_By_Film_CategoryRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_sales_by_film_category() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Sales_By_Film_CategoryRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_sales_by_film_category(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Sales_By_Film_CategoryRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Sales_By_Film_CategoryRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.category, SQLCompose.nextalias(alias, :category), i)
                i = SQLCompose.foreachfield(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Sales_By_Film_CategoryRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Sales_By_Film_CategoryRow(SQLCompose.mapfields(f, result.category, SQLCompose.nextalias(alias, :category)), SQLCompose.mapfields(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Sales_By_Film_CategoryRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.category, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.total_sales, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Sales_By_StoreRow <: SQLCompose.RowStruct{RowType{:sales_by_store, (:store, :manager, :total_sales), Tuple{TextType, TextType, SQLCompose.DecimalType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            store
            manager
            total_sales
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        sales_by_store_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Sales_By_StoreRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Sales_By_StoreRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Sales_By_StoreRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Sales_By_StoreRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Sales_By_StoreRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_sales_by_store() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Sales_By_StoreRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_sales_by_store(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Sales_By_StoreRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Sales_By_StoreRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.store, SQLCompose.nextalias(alias, :store), i)
                i = SQLCompose.foreachfield(f, result.manager, SQLCompose.nextalias(alias, :manager), i)
                i = SQLCompose.foreachfield(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Sales_By_StoreRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Sales_By_StoreRow(SQLCompose.mapfields(f, result.store, SQLCompose.nextalias(alias, :store)), SQLCompose.mapfields(f, result.manager, SQLCompose.nextalias(alias, :manager)), SQLCompose.mapfields(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Sales_By_StoreRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.store, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.manager, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.total_sales, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct StaffRow <: SQLCompose.RowStruct{RowType{:staff, (:staff_id, :first_name, :last_name, :address_id, :email, :store_id, :active, :username, :password, :last_update, :picture), Tuple{Int4Type, TextType, TextType, Int4Type, TextType, Int4Type, BooleanType, TextType, TextType, SQLCompose.TimestampType, SQLCompose.BlobType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        staff_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(StaffRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(StaffRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{StaffRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{StaffRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(StaffRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_staff() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(StaffRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_staff(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(StaffRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::StaffRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::StaffRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            StaffRow(SQLCompose.mapfields(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.email, SQLCompose.nextalias(alias, :email)), SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.active, SQLCompose.nextalias(alias, :active)), SQLCompose.mapfields(f, result.username, SQLCompose.nextalias(alias, :username)), SQLCompose.mapfields(f, result.password, SQLCompose.nextalias(alias, :password)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.picture, SQLCompose.nextalias(alias, :picture)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::StaffRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.staff_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.first_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.address_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.email, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.store_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.active, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.username, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.password, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.picture, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct Staff_ListRow <: SQLCompose.RowStruct{RowType{:staff_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :sid), Tuple{Int4Type, TextType, TextType, TextType, TextType, TextType, TextType, Int4Type}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            id
            name
            address
            var"zip code"
            phone
            city
            country
            sid
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        staff_list_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(Staff_ListRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(Staff_ListRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{Staff_ListRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{Staff_ListRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(Staff_ListRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_staff_list() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(Staff_ListRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_staff_list(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(Staff_ListRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::Staff_ListRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
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
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::Staff_ListRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            Staff_ListRow(SQLCompose.mapfields(f, result.id, SQLCompose.nextalias(alias, :id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.address, SQLCompose.nextalias(alias, :address)), SQLCompose.mapfields(f, result.var"zip code", SQLCompose.nextalias(alias, Symbol("zip code"))), SQLCompose.mapfields(f, result.phone, SQLCompose.nextalias(alias, :phone)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.country, SQLCompose.nextalias(alias, :country)), SQLCompose.mapfields(f, result.sid, SQLCompose.nextalias(alias, :sid)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Staff_ListRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.address, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.var"zip code", tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.phone, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.country, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.sid, tableitem)
        end
    end
    begin
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:95 =#
        struct StoreRow <: SQLCompose.RowStruct{RowType{:store, (:store_id, :manager_staff_id, :address_id, :last_update), Tuple{Int4Type, Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            store_id
            manager_staff_id
            address_id
            last_update
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:96 =#
        store_table() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:71 =#
                SQLCompose.table(StoreRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:97 =#
        let q = SQLCompose.SelectQuery(StoreRow)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
            global SQLCompose.query(::Type{StoreRow}) = begin
                        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:66 =#
                        q
                    end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
        SQLCompose.query(::Type{StoreRow}, executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
                SQLCompose.QuerySet(query(StoreRow), executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:99 =#
        query_store() = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:73 =#
                query(StoreRow)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:100 =#
        query_store(executor::SQLCompose.AbstractQueryExecutor) = begin
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
                query(StoreRow, executor)
            end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:101 =#
        function SQLCompose.foreachfield(f::Function, result::StoreRow, alias, index)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:77 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:78 =#
            let i = index
                #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:79 =#
                i = SQLCompose.foreachfield(f, result.store_id, SQLCompose.nextalias(alias, :store_id), i)
                i = SQLCompose.foreachfield(f, result.manager_staff_id, SQLCompose.nextalias(alias, :manager_staff_id), i)
                i = SQLCompose.foreachfield(f, result.address_id, SQLCompose.nextalias(alias, :address_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:102 =#
        function SQLCompose.mapfields(f::Function, result::StoreRow, alias)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:84 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:85 =#
            StoreRow(SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.manager_staff_id, SQLCompose.nextalias(alias, :manager_staff_id)), SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:103 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::StoreRow, tableitem)
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:89 =#
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:90 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.store_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.manager_staff_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.address_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:146 =#
    city_of(address::AddressRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(CityRow, (:city_id,), (address.city_id,))
        end
    country_of(city::CityRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(CountryRow, (:country_id,), (city.country_id,))
        end
    store_of(customer::CustomerRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(StoreRow, (:store_id,), (customer.store_id,))
        end
    address_of(customer::CustomerRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(AddressRow, (:address_id,), (customer.address_id,))
        end
    language_of(film::FilmRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(LanguageRow, (:language_id,), (film.language_id,))
        end
    original_language_of(film::FilmRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(LanguageRow, (:language_id,), (film.original_language_id,))
        end
    actor_of(film_actor::Film_ActorRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(ActorRow, (:actor_id,), (film_actor.actor_id,))
        end
    film_of(film_actor::Film_ActorRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(FilmRow, (:film_id,), (film_actor.film_id,))
        end
    actor_of(film_actor_extension::Film_Actor_ExtensionRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(ActorRow, (:actor_id,), (film_actor_extension.actor_id,))
        end
    actor_film_of(film_actor_extension2::Film_Actor_Extension2Row) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(Film_ActorRow, (:film_id, :actor_id), (film_actor_extension2.actor_id, film_actor_extension2.film_id))
        end
    actor_of(film_actor_extension2::Film_Actor_Extension2Row) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(ActorRow, (:actor_id,), (film_actor_extension2.actor_id,))
        end
    film_of(film_actor_extension2::Film_Actor_Extension2Row) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(ActorRow, (:actor_id,), (film_actor_extension2.film_id,))
        end
    category_of(film_category::Film_CategoryRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(CategoryRow, (:category_id,), (film_category.category_id,))
        end
    film_of(film_category::Film_CategoryRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(FilmRow, (:film_id,), (film_category.film_id,))
        end
    film_of(inventory::InventoryRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(FilmRow, (:film_id,), (inventory.film_id,))
        end
    store_of(inventory::InventoryRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(StoreRow, (:store_id,), (inventory.store_id,))
        end
    customer_of(rental::RentalRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(CustomerRow, (:customer_id,), (rental.customer_id,))
        end
    inventory_of(rental::RentalRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(InventoryRow, (:inventory_id,), (rental.inventory_id,))
        end
    staff_of(rental::RentalRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(StaffRow, (:staff_id,), (rental.staff_id,))
        end
    address_of(staff::StaffRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(AddressRow, (:address_id,), (staff.address_id,))
        end
    store_of(staff::StaffRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(StoreRow, (:store_id,), (staff.store_id,))
        end
    address_of(store::StoreRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:116 =#
            SQLCompose.reference(AddressRow, (:address_id,), (store.address_id,))
        end
    #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:147 =#
    all_address_of(city::CityRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(AddressRow, (:city_id,), (city.city_id,))
        end
    all_city_of(country::CountryRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(CityRow, (:country_id,), (country.country_id,))
        end
    all_customer_of(store::StoreRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(CustomerRow, (:store_id,), (store.store_id,))
        end
    all_customer_of(address::AddressRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(CustomerRow, (:address_id,), (address.address_id,))
        end
    all_film_of(language::LanguageRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(FilmRow, (:language_id,), (language.language_id,))
        end
    all_original_language_of(language::LanguageRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(FilmRow, (:original_language_id,), (language.language_id,))
        end
    all_film_actor_of(actor::ActorRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Film_ActorRow, (:actor_id,), (actor.actor_id,))
        end
    all_film_actor_of(film::FilmRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Film_ActorRow, (:film_id,), (film.film_id,))
        end
    all_film_actor_extension_of(actor::ActorRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Film_Actor_ExtensionRow, (:actor_id,), (actor.actor_id,))
        end
    all_actor_film_of(film_actor::Film_ActorRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Film_Actor_Extension2Row, (:actor_id, :film_id), (film_actor.film_id, film_actor.actor_id))
        end
    all_film_actor_extension2_of(actor::ActorRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Film_Actor_Extension2Row, (:actor_id,), (actor.actor_id,))
        end
    all_film_of(actor::ActorRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Film_Actor_Extension2Row, (:film_id,), (actor.actor_id,))
        end
    all_film_category_of(category::CategoryRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Film_CategoryRow, (:category_id,), (category.category_id,))
        end
    all_film_category_of(film::FilmRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(Film_CategoryRow, (:film_id,), (film.film_id,))
        end
    all_inventory_of(film::FilmRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(InventoryRow, (:film_id,), (film.film_id,))
        end
    all_inventory_of(store::StoreRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(InventoryRow, (:store_id,), (store.store_id,))
        end
    all_rental_of(customer::CustomerRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(RentalRow, (:customer_id,), (customer.customer_id,))
        end
    all_rental_of(inventory::InventoryRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(RentalRow, (:inventory_id,), (inventory.inventory_id,))
        end
    all_rental_of(staff::StaffRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(RentalRow, (:staff_id,), (staff.staff_id,))
        end
    all_staff_of(address::AddressRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(StaffRow, (:address_id,), (address.address_id,))
        end
    all_staff_of(store::StoreRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(StaffRow, (:store_id,), (store.store_id,))
        end
    all_store_of(address::AddressRow) = begin
            #= C:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:123 =#
            SQLCompose.reference(StoreRow, (:address_id,), (address.address_id,))
        end
end
end