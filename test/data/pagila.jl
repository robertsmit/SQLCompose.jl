module Pagila
#= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:14 =#
#= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:15 =#
using SQLCompose
#= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:16 =#
begin
    #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:117 =#
    export Actor, Actor_Info, Address, Category, City, Country, Customer, Customer_List, Film, Film_Actor, Film_Actor_Extension, Film_Actor_Extension2, Film_Category, Film_List, Inventory, Inventory_Item, Inventory_Item2, Inventory_Item3, Inventory_Item4, Language, Nicer_But_Slower_Film_List, Payment, Rental, Sales_By_Film_Category, Sales_By_Store, Staff, Staff_List, Store
    export city_of, country_of, store_of, address_of, language_of, original_language_of, actor_of, film_of, actor_of, actor_film_of, actor_of, film_of, category_of, film_of, film_of, store_of, customer_of, inventory_of, staff_of, address_of, store_of, address_of
    export all_address_of, all_city_of, all_customer_of, all_customer_of, all_film_of, all_original_language_of, all_film_actor_of, all_film_actor_of, all_film_actor_extension_of, all_actor_film_of, all_film_actor_extension2_of, all_film_of, all_film_category_of, all_film_category_of, all_inventory_of, all_inventory_of, all_rental_of, all_rental_of, all_rental_of, all_staff_of, all_staff_of, all_store_of
    #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:118 =#
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Actor <: SQLCompose.RowStruct{RowType{:actor, (:actor_id, :first_name, :last_name, :last_update), Tuple{Int4Type, TextType, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            actor_id
            first_name
            last_name
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Actor, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.first_name, SQLCompose.nextalias(alias, :first_name), i)
                i = SQLCompose.foreachfield(f, result.last_name, SQLCompose.nextalias(alias, :last_name), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Actor, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Actor(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Actor, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.first_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Actor_Info <: SQLCompose.RowStruct{RowType{:actor_info, (:actor_id, :first_name, :last_name, :film_info), Tuple{Int4Type, TextType, TextType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            actor_id
            first_name
            last_name
            film_info
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Actor_Info, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.first_name, SQLCompose.nextalias(alias, :first_name), i)
                i = SQLCompose.foreachfield(f, result.last_name, SQLCompose.nextalias(alias, :last_name), i)
                i = SQLCompose.foreachfield(f, result.film_info, SQLCompose.nextalias(alias, :film_info), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Actor_Info, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Actor_Info(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.film_info, SQLCompose.nextalias(alias, :film_info)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Actor_Info, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.first_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_info, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Address <: SQLCompose.RowStruct{RowType{:address, (:address_id, :address, :address2, :district, :city_id, :postal_code, :phone, :last_update), Tuple{Int4Type, TextType, TextType, TextType, Int4Type, TextType, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            address_id
            address
            address2
            district
            city_id
            postal_code
            phone
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Address, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Address, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Address(SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.address, SQLCompose.nextalias(alias, :address)), SQLCompose.mapfields(f, result.address2, SQLCompose.nextalias(alias, :address2)), SQLCompose.mapfields(f, result.district, SQLCompose.nextalias(alias, :district)), SQLCompose.mapfields(f, result.city_id, SQLCompose.nextalias(alias, :city_id)), SQLCompose.mapfields(f, result.postal_code, SQLCompose.nextalias(alias, :postal_code)), SQLCompose.mapfields(f, result.phone, SQLCompose.nextalias(alias, :phone)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Address, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Category <: SQLCompose.RowStruct{RowType{:category, (:category_id, :name, :last_update), Tuple{Int4Type, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            category_id
            name
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Category, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.category_id, SQLCompose.nextalias(alias, :category_id), i)
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Category, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Category(SQLCompose.mapfields(f, result.category_id, SQLCompose.nextalias(alias, :category_id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Category, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.category_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct City <: SQLCompose.RowStruct{RowType{:city, (:city_id, :city, :country_id, :last_update), Tuple{Int4Type, TextType, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            city_id
            city
            country_id
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::City, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.city_id, SQLCompose.nextalias(alias, :city_id), i)
                i = SQLCompose.foreachfield(f, result.city, SQLCompose.nextalias(alias, :city), i)
                i = SQLCompose.foreachfield(f, result.country_id, SQLCompose.nextalias(alias, :country_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::City, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            City(SQLCompose.mapfields(f, result.city_id, SQLCompose.nextalias(alias, :city_id)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.country_id, SQLCompose.nextalias(alias, :country_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::City, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.city_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.city, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.country_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Country <: SQLCompose.RowStruct{RowType{:country, (:country_id, :country, :last_update), Tuple{Int4Type, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            country_id
            country
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Country, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.country_id, SQLCompose.nextalias(alias, :country_id), i)
                i = SQLCompose.foreachfield(f, result.country, SQLCompose.nextalias(alias, :country), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Country, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Country(SQLCompose.mapfields(f, result.country_id, SQLCompose.nextalias(alias, :country_id)), SQLCompose.mapfields(f, result.country, SQLCompose.nextalias(alias, :country)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Country, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.country_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.country, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Customer <: SQLCompose.RowStruct{RowType{:customer, (:customer_id, :store_id, :first_name, :last_name, :email, :address_id, :activebool, :create_date, :last_update, :active), Tuple{Int4Type, Int4Type, TextType, TextType, TextType, Int4Type, BooleanType, SQLCompose.DateType, SQLCompose.TimestampType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Customer, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Customer, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Customer(SQLCompose.mapfields(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id)), SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.email, SQLCompose.nextalias(alias, :email)), SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.activebool, SQLCompose.nextalias(alias, :activebool)), SQLCompose.mapfields(f, result.create_date, SQLCompose.nextalias(alias, :create_date)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.active, SQLCompose.nextalias(alias, :active)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Customer, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Customer_List <: SQLCompose.RowStruct{RowType{:customer_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :notes, :sid), Tuple{Int4Type, TextType, TextType, TextType, TextType, TextType, TextType, TextType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Customer_List, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Customer_List, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Customer_List(SQLCompose.mapfields(f, result.id, SQLCompose.nextalias(alias, :id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.address, SQLCompose.nextalias(alias, :address)), SQLCompose.mapfields(f, result.var"zip code", SQLCompose.nextalias(alias, Symbol("zip code"))), SQLCompose.mapfields(f, result.phone, SQLCompose.nextalias(alias, :phone)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.country, SQLCompose.nextalias(alias, :country)), SQLCompose.mapfields(f, result.notes, SQLCompose.nextalias(alias, :notes)), SQLCompose.mapfields(f, result.sid, SQLCompose.nextalias(alias, :sid)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Customer_List, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Film <: SQLCompose.RowStruct{RowType{:film, (:film_id, :title, :description, :release_year, :language_id, :original_language_id, :rental_duration, :rental_rate, :length, :replacement_cost, :rating, :last_update, :special_features, :fulltext), Tuple{Int4Type, TextType, TextType, Int4Type, Int4Type, Int4Type, Int2Type, SQLCompose.DecimalType, Int2Type, SQLCompose.DecimalType, EnumType, SQLCompose.TimestampType, SQLCompose.ArrayType{TextType}, SQLCompose.UnknownType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Film, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Film, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Film(SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.title, SQLCompose.nextalias(alias, :title)), SQLCompose.mapfields(f, result.description, SQLCompose.nextalias(alias, :description)), SQLCompose.mapfields(f, result.release_year, SQLCompose.nextalias(alias, :release_year)), SQLCompose.mapfields(f, result.language_id, SQLCompose.nextalias(alias, :language_id)), SQLCompose.mapfields(f, result.original_language_id, SQLCompose.nextalias(alias, :original_language_id)), SQLCompose.mapfields(f, result.rental_duration, SQLCompose.nextalias(alias, :rental_duration)), SQLCompose.mapfields(f, result.rental_rate, SQLCompose.nextalias(alias, :rental_rate)), SQLCompose.mapfields(f, result.length, SQLCompose.nextalias(alias, :length)), SQLCompose.mapfields(f, result.replacement_cost, SQLCompose.nextalias(alias, :replacement_cost)), SQLCompose.mapfields(f, result.rating, SQLCompose.nextalias(alias, :rating)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.special_features, SQLCompose.nextalias(alias, :special_features)), SQLCompose.mapfields(f, result.fulltext, SQLCompose.nextalias(alias, :fulltext)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Film_Actor <: SQLCompose.RowStruct{RowType{:film_actor, (:actor_id, :film_id, :last_update), Tuple{Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            actor_id
            film_id
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Film_Actor, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Film_Actor, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Film_Actor(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_Actor, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Film_Actor_Extension <: SQLCompose.RowStruct{RowType{:film_actor_extension, (:actor_id, :film_id), Tuple{Int4Type, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            actor_id
            film_id
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Film_Actor_Extension, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Film_Actor_Extension, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Film_Actor_Extension(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_Actor_Extension, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Film_Actor_Extension2 <: SQLCompose.RowStruct{RowType{:film_actor_extension2, (:actor_id, :film_id), Tuple{Int4Type, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            actor_id
            film_id
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Film_Actor_Extension2, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Film_Actor_Extension2, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Film_Actor_Extension2(SQLCompose.mapfields(f, result.actor_id, SQLCompose.nextalias(alias, :actor_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_Actor_Extension2, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.actor_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Film_Category <: SQLCompose.RowStruct{RowType{:film_category, (:film_id, :category_id, :last_update), Tuple{Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            film_id
            category_id
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Film_Category, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.category_id, SQLCompose.nextalias(alias, :category_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Film_Category, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Film_Category(SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.category_id, SQLCompose.nextalias(alias, :category_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_Category, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.category_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Film_List <: SQLCompose.RowStruct{RowType{:film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, TextType, TextType, TextType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            fid
            title
            description
            category
            price
            length
            rating
            actors
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Film_List, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Film_List, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Film_List(SQLCompose.mapfields(f, result.fid, SQLCompose.nextalias(alias, :fid)), SQLCompose.mapfields(f, result.title, SQLCompose.nextalias(alias, :title)), SQLCompose.mapfields(f, result.description, SQLCompose.nextalias(alias, :description)), SQLCompose.mapfields(f, result.category, SQLCompose.nextalias(alias, :category)), SQLCompose.mapfields(f, result.price, SQLCompose.nextalias(alias, :price)), SQLCompose.mapfields(f, result.length, SQLCompose.nextalias(alias, :length)), SQLCompose.mapfields(f, result.rating, SQLCompose.nextalias(alias, :rating)), SQLCompose.mapfields(f, result.actors, SQLCompose.nextalias(alias, :actors)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Film_List, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Inventory <: SQLCompose.RowStruct{RowType{:inventory, (:inventory_id, :film_id, :store_id, :last_update), Tuple{Int4Type, Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            inventory_id
            film_id
            store_id
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id), i)
                i = SQLCompose.foreachfield(f, result.film_id, SQLCompose.nextalias(alias, :film_id), i)
                i = SQLCompose.foreachfield(f, result.store_id, SQLCompose.nextalias(alias, :store_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Inventory, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Inventory(SQLCompose.mapfields(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id)), SQLCompose.mapfields(f, result.film_id, SQLCompose.nextalias(alias, :film_id)), SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Inventory, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.inventory_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.film_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.store_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Inventory_Item <: SQLCompose.RowStruct{RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            name
            supplier_id
            price
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_id, SQLCompose.nextalias(alias, :supplier_id), i)
                i = SQLCompose.foreachfield(f, result.price, SQLCompose.nextalias(alias, :price), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Inventory_Item(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_id, SQLCompose.nextalias(alias, :supplier_id)), SQLCompose.mapfields(f, result.price, SQLCompose.nextalias(alias, :price)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Inventory_Item, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.supplier_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.price, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Inventory_Item2 <: SQLCompose.RowStruct{RowType{:inventory_item2, (:name, :supplier_ids, :prices), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            name
            supplier_ids
            prices
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item2, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids), i)
                i = SQLCompose.foreachfield(f, result.prices, SQLCompose.nextalias(alias, :prices), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item2, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Inventory_Item2(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids)), SQLCompose.mapfields(f, result.prices, SQLCompose.nextalias(alias, :prices)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Inventory_Item2, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.supplier_ids, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.prices, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Inventory_Item3 <: SQLCompose.RowStruct{RowType{:inventory_item3, (:name, :supplier_ids, :prices, :dt, :item), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}, SQLCompose.TimestampType, RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            name
            supplier_ids
            prices
            dt
            item
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item3, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids), i)
                i = SQLCompose.foreachfield(f, result.prices, SQLCompose.nextalias(alias, :prices), i)
                i = SQLCompose.foreachfield(f, result.dt, SQLCompose.nextalias(alias, :dt), i)
                i = SQLCompose.foreachfield(f, result.item, SQLCompose.nextalias(alias, :item), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item3, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Inventory_Item3(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids)), SQLCompose.mapfields(f, result.prices, SQLCompose.nextalias(alias, :prices)), SQLCompose.mapfields(f, result.dt, SQLCompose.nextalias(alias, :dt)), SQLCompose.mapfields(f, result.item, SQLCompose.nextalias(alias, :item)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Inventory_Item3, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.supplier_ids, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.prices, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.dt, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.item, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Inventory_Item4 <: SQLCompose.RowStruct{RowType{:inventory_item4, (:name, :supplier_ids, :prices), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            name
            supplier_ids
            prices
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Inventory_Item4, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids), i)
                i = SQLCompose.foreachfield(f, result.prices, SQLCompose.nextalias(alias, :prices), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Inventory_Item4, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Inventory_Item4(SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.supplier_ids, SQLCompose.nextalias(alias, :supplier_ids)), SQLCompose.mapfields(f, result.prices, SQLCompose.nextalias(alias, :prices)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Inventory_Item4, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.supplier_ids, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.prices, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Language <: SQLCompose.RowStruct{RowType{:language, (:language_id, :name, :last_update), Tuple{Int4Type, CharType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            language_id
            name
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Language, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.language_id, SQLCompose.nextalias(alias, :language_id), i)
                i = SQLCompose.foreachfield(f, result.name, SQLCompose.nextalias(alias, :name), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Language, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Language(SQLCompose.mapfields(f, result.language_id, SQLCompose.nextalias(alias, :language_id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Language, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.language_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.name, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Nicer_But_Slower_Film_List <: SQLCompose.RowStruct{RowType{:nicer_but_slower_film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, TextType, TextType, TextType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            fid
            title
            description
            category
            price
            length
            rating
            actors
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Nicer_But_Slower_Film_List, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Nicer_But_Slower_Film_List, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Nicer_But_Slower_Film_List(SQLCompose.mapfields(f, result.fid, SQLCompose.nextalias(alias, :fid)), SQLCompose.mapfields(f, result.title, SQLCompose.nextalias(alias, :title)), SQLCompose.mapfields(f, result.description, SQLCompose.nextalias(alias, :description)), SQLCompose.mapfields(f, result.category, SQLCompose.nextalias(alias, :category)), SQLCompose.mapfields(f, result.price, SQLCompose.nextalias(alias, :price)), SQLCompose.mapfields(f, result.length, SQLCompose.nextalias(alias, :length)), SQLCompose.mapfields(f, result.rating, SQLCompose.nextalias(alias, :rating)), SQLCompose.mapfields(f, result.actors, SQLCompose.nextalias(alias, :actors)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Nicer_But_Slower_Film_List, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Payment <: SQLCompose.RowStruct{RowType{:payment, (:payment_id, :customer_id, :staff_id, :rental_id, :amount, :payment_date), Tuple{Int4Type, Int4Type, Int4Type, Int4Type, SQLCompose.DecimalType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            payment_id
            customer_id
            staff_id
            rental_id
            amount
            payment_date
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Payment, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.payment_id, SQLCompose.nextalias(alias, :payment_id), i)
                i = SQLCompose.foreachfield(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id), i)
                i = SQLCompose.foreachfield(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id), i)
                i = SQLCompose.foreachfield(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id), i)
                i = SQLCompose.foreachfield(f, result.amount, SQLCompose.nextalias(alias, :amount), i)
                i = SQLCompose.foreachfield(f, result.payment_date, SQLCompose.nextalias(alias, :payment_date), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Payment, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Payment(SQLCompose.mapfields(f, result.payment_id, SQLCompose.nextalias(alias, :payment_id)), SQLCompose.mapfields(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id)), SQLCompose.mapfields(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id)), SQLCompose.mapfields(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id)), SQLCompose.mapfields(f, result.amount, SQLCompose.nextalias(alias, :amount)), SQLCompose.mapfields(f, result.payment_date, SQLCompose.nextalias(alias, :payment_date)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Payment, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.payment_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.customer_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.staff_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.rental_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.amount, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.payment_date, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Rental <: SQLCompose.RowStruct{RowType{:rental, (:rental_id, :rental_date, :inventory_id, :customer_id, :return_date, :staff_id, :last_update), Tuple{Int4Type, SQLCompose.TimestampType, Int4Type, Int4Type, SQLCompose.TimestampType, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            rental_id
            rental_date
            inventory_id
            customer_id
            return_date
            staff_id
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Rental, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id), i)
                i = SQLCompose.foreachfield(f, result.rental_date, SQLCompose.nextalias(alias, :rental_date), i)
                i = SQLCompose.foreachfield(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id), i)
                i = SQLCompose.foreachfield(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id), i)
                i = SQLCompose.foreachfield(f, result.return_date, SQLCompose.nextalias(alias, :return_date), i)
                i = SQLCompose.foreachfield(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Rental, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Rental(SQLCompose.mapfields(f, result.rental_id, SQLCompose.nextalias(alias, :rental_id)), SQLCompose.mapfields(f, result.rental_date, SQLCompose.nextalias(alias, :rental_date)), SQLCompose.mapfields(f, result.inventory_id, SQLCompose.nextalias(alias, :inventory_id)), SQLCompose.mapfields(f, result.customer_id, SQLCompose.nextalias(alias, :customer_id)), SQLCompose.mapfields(f, result.return_date, SQLCompose.nextalias(alias, :return_date)), SQLCompose.mapfields(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Rental, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Sales_By_Film_Category <: SQLCompose.RowStruct{RowType{:sales_by_film_category, (:category, :total_sales), Tuple{TextType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            category
            total_sales
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Sales_By_Film_Category, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.category, SQLCompose.nextalias(alias, :category), i)
                i = SQLCompose.foreachfield(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Sales_By_Film_Category, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Sales_By_Film_Category(SQLCompose.mapfields(f, result.category, SQLCompose.nextalias(alias, :category)), SQLCompose.mapfields(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Sales_By_Film_Category, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.category, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.total_sales, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Sales_By_Store <: SQLCompose.RowStruct{RowType{:sales_by_store, (:store, :manager, :total_sales), Tuple{TextType, TextType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            store
            manager
            total_sales
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Sales_By_Store, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.store, SQLCompose.nextalias(alias, :store), i)
                i = SQLCompose.foreachfield(f, result.manager, SQLCompose.nextalias(alias, :manager), i)
                i = SQLCompose.foreachfield(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Sales_By_Store, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Sales_By_Store(SQLCompose.mapfields(f, result.store, SQLCompose.nextalias(alias, :store)), SQLCompose.mapfields(f, result.manager, SQLCompose.nextalias(alias, :manager)), SQLCompose.mapfields(f, result.total_sales, SQLCompose.nextalias(alias, :total_sales)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Sales_By_Store, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.store, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.manager, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.total_sales, tableitem)
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Staff <: SQLCompose.RowStruct{RowType{:staff, (:staff_id, :first_name, :last_name, :address_id, :email, :store_id, :active, :username, :password, :last_update, :picture), Tuple{Int4Type, TextType, TextType, Int4Type, TextType, Int4Type, BooleanType, TextType, TextType, SQLCompose.TimestampType, SQLCompose.BlobType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Staff, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Staff, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Staff(SQLCompose.mapfields(f, result.staff_id, SQLCompose.nextalias(alias, :staff_id)), SQLCompose.mapfields(f, result.first_name, SQLCompose.nextalias(alias, :first_name)), SQLCompose.mapfields(f, result.last_name, SQLCompose.nextalias(alias, :last_name)), SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.email, SQLCompose.nextalias(alias, :email)), SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.active, SQLCompose.nextalias(alias, :active)), SQLCompose.mapfields(f, result.username, SQLCompose.nextalias(alias, :username)), SQLCompose.mapfields(f, result.password, SQLCompose.nextalias(alias, :password)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)), SQLCompose.mapfields(f, result.picture, SQLCompose.nextalias(alias, :picture)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Staff, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Staff_List <: SQLCompose.RowStruct{RowType{:staff_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :sid), Tuple{Int4Type, TextType, TextType, TextType, TextType, TextType, TextType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            id
            name
            address
            var"zip code"
            phone
            city
            country
            sid
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Staff_List, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Staff_List, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Staff_List(SQLCompose.mapfields(f, result.id, SQLCompose.nextalias(alias, :id)), SQLCompose.mapfields(f, result.name, SQLCompose.nextalias(alias, :name)), SQLCompose.mapfields(f, result.address, SQLCompose.nextalias(alias, :address)), SQLCompose.mapfields(f, result.var"zip code", SQLCompose.nextalias(alias, Symbol("zip code"))), SQLCompose.mapfields(f, result.phone, SQLCompose.nextalias(alias, :phone)), SQLCompose.mapfields(f, result.city, SQLCompose.nextalias(alias, :city)), SQLCompose.mapfields(f, result.country, SQLCompose.nextalias(alias, :country)), SQLCompose.mapfields(f, result.sid, SQLCompose.nextalias(alias, :sid)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Staff_List, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:80 =#
        struct Store <: SQLCompose.RowStruct{RowType{:store, (:store_id, :manager_staff_id, :address_id, :last_update), Tuple{Int4Type, Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:58 =#
            store_id
            manager_staff_id
            address_id
            last_update
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:81 =#
        function SQLCompose.foreachfield(f::Function, result::Store, alias, index)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:62 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:63 =#
            let i = index
                #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:64 =#
                i = SQLCompose.foreachfield(f, result.store_id, SQLCompose.nextalias(alias, :store_id), i)
                i = SQLCompose.foreachfield(f, result.manager_staff_id, SQLCompose.nextalias(alias, :manager_staff_id), i)
                i = SQLCompose.foreachfield(f, result.address_id, SQLCompose.nextalias(alias, :address_id), i)
                i = SQLCompose.foreachfield(f, result.last_update, SQLCompose.nextalias(alias, :last_update), i)
            end
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:82 =#
        function SQLCompose.mapfields(f::Function, result::Store, alias)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:69 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:70 =#
            Store(SQLCompose.mapfields(f, result.store_id, SQLCompose.nextalias(alias, :store_id)), SQLCompose.mapfields(f, result.manager_staff_id, SQLCompose.nextalias(alias, :manager_staff_id)), SQLCompose.mapfields(f, result.address_id, SQLCompose.nextalias(alias, :address_id)), SQLCompose.mapfields(f, result.last_update, SQLCompose.nextalias(alias, :last_update)))
        end
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:83 =#
        function SQLCompose.write_referredtable_location_plan!(plan, node::Store, tableitem)
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:75 =#
            SQLCompose.write_referredtable_location_plan!(plan, node.store_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.manager_staff_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.address_id, tableitem)
            SQLCompose.write_referredtable_location_plan!(plan, node.last_update, tableitem)
        end
    end
    #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:119 =#
    city_of(address::Address) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(City, (:city_id,), (address.city_id,))
        end
    country_of(city::City) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Country, (:country_id,), (city.country_id,))
        end
    store_of(customer::Customer) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Store, (:store_id,), (customer.store_id,))
        end
    address_of(customer::Customer) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Address, (:address_id,), (customer.address_id,))
        end
    language_of(film::Film) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Language, (:language_id,), (film.language_id,))
        end
    original_language_of(film::Film) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Language, (:language_id,), (film.original_language_id,))
        end
    actor_of(film_actor::Film_Actor) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Actor, (:actor_id,), (film_actor.actor_id,))
        end
    film_of(film_actor::Film_Actor) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Film, (:film_id,), (film_actor.film_id,))
        end
    actor_of(film_actor_extension::Film_Actor_Extension) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Actor, (:actor_id,), (film_actor_extension.actor_id,))
        end
    actor_film_of(film_actor_extension2::Film_Actor_Extension2) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Film_Actor, (:film_id, :actor_id), (film_actor_extension2.actor_id, film_actor_extension2.film_id))
        end
    actor_of(film_actor_extension2::Film_Actor_Extension2) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Actor, (:actor_id,), (film_actor_extension2.actor_id,))
        end
    film_of(film_actor_extension2::Film_Actor_Extension2) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Actor, (:actor_id,), (film_actor_extension2.film_id,))
        end
    category_of(film_category::Film_Category) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Category, (:category_id,), (film_category.category_id,))
        end
    film_of(film_category::Film_Category) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Film, (:film_id,), (film_category.film_id,))
        end
    film_of(inventory::Inventory) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Film, (:film_id,), (inventory.film_id,))
        end
    store_of(inventory::Inventory) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Store, (:store_id,), (inventory.store_id,))
        end
    customer_of(rental::Rental) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Customer, (:customer_id,), (rental.customer_id,))
        end
    inventory_of(rental::Rental) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Inventory, (:inventory_id,), (rental.inventory_id,))
        end
    staff_of(rental::Rental) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Staff, (:staff_id,), (rental.staff_id,))
        end
    address_of(staff::Staff) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Address, (:address_id,), (staff.address_id,))
        end
    store_of(staff::Staff) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Store, (:store_id,), (staff.store_id,))
        end
    address_of(store::Store) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:91 =#
            SQLCompose.reference(Address, (:address_id,), (store.address_id,))
        end
    #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:120 =#
    all_address_of(city::City) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Address, (:city_id,), (city.city_id,))
        end
    all_city_of(country::Country) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(City, (:country_id,), (country.country_id,))
        end
    all_customer_of(store::Store) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Customer, (:store_id,), (store.store_id,))
        end
    all_customer_of(address::Address) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Customer, (:address_id,), (address.address_id,))
        end
    all_film_of(language::Language) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film, (:language_id,), (language.language_id,))
        end
    all_original_language_of(language::Language) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film, (:original_language_id,), (language.language_id,))
        end
    all_film_actor_of(actor::Actor) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film_Actor, (:actor_id,), (actor.actor_id,))
        end
    all_film_actor_of(film::Film) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film_Actor, (:film_id,), (film.film_id,))
        end
    all_film_actor_extension_of(actor::Actor) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film_Actor_Extension, (:actor_id,), (actor.actor_id,))
        end
    all_actor_film_of(film_actor::Film_Actor) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film_Actor_Extension2, (:actor_id, :film_id), (film_actor.film_id, film_actor.actor_id))
        end
    all_film_actor_extension2_of(actor::Actor) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film_Actor_Extension2, (:actor_id,), (actor.actor_id,))
        end
    all_film_of(actor::Actor) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film_Actor_Extension2, (:film_id,), (actor.actor_id,))
        end
    all_film_category_of(category::Category) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film_Category, (:category_id,), (category.category_id,))
        end
    all_film_category_of(film::Film) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Film_Category, (:film_id,), (film.film_id,))
        end
    all_inventory_of(film::Film) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Inventory, (:film_id,), (film.film_id,))
        end
    all_inventory_of(store::Store) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Inventory, (:store_id,), (store.store_id,))
        end
    all_rental_of(customer::Customer) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Rental, (:customer_id,), (customer.customer_id,))
        end
    all_rental_of(inventory::Inventory) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Rental, (:inventory_id,), (inventory.inventory_id,))
        end
    all_rental_of(staff::Staff) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Rental, (:staff_id,), (staff.staff_id,))
        end
    all_staff_of(address::Address) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Staff, (:address_id,), (address.address_id,))
        end
    all_staff_of(store::Store) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Staff, (:store_id,), (store.store_id,))
        end
    all_store_of(address::Address) = begin
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:98 =#
            SQLCompose.reference(Store, (:address_id,), (address.address_id,))
        end
end
end