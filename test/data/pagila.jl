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
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Actor <: SQLCompose.RowStruct{RowType{:actor, (:actor_id, :first_name, :last_name, :last_update), Tuple{Int4Type, TextType, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            actor_id
            first_name
            last_name
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Actor_Info <: SQLCompose.RowStruct{RowType{:actor_info, (:actor_id, :first_name, :last_name, :film_info), Tuple{Int4Type, TextType, TextType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            actor_id
            first_name
            last_name
            film_info
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Address <: SQLCompose.RowStruct{RowType{:address, (:address_id, :address, :address2, :district, :city_id, :postal_code, :phone, :last_update), Tuple{Int4Type, TextType, TextType, TextType, Int4Type, TextType, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            address_id
            address
            address2
            district
            city_id
            postal_code
            phone
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Category <: SQLCompose.RowStruct{RowType{:category, (:category_id, :name, :last_update), Tuple{Int4Type, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            category_id
            name
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct City <: SQLCompose.RowStruct{RowType{:city, (:city_id, :city, :country_id, :last_update), Tuple{Int4Type, TextType, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            city_id
            city
            country_id
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Country <: SQLCompose.RowStruct{RowType{:country, (:country_id, :country, :last_update), Tuple{Int4Type, TextType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            country_id
            country
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Customer <: SQLCompose.RowStruct{RowType{:customer, (:customer_id, :store_id, :first_name, :last_name, :email, :address_id, :activebool, :create_date, :last_update, :active), Tuple{Int4Type, Int4Type, TextType, TextType, TextType, Int4Type, BooleanType, SQLCompose.DateType, SQLCompose.TimestampType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
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
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Customer_List <: SQLCompose.RowStruct{RowType{:customer_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :notes, :sid), Tuple{Int4Type, TextType, TextType, TextType, TextType, TextType, TextType, TextType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
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
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Film <: SQLCompose.RowStruct{RowType{:film, (:film_id, :title, :description, :release_year, :language_id, :original_language_id, :rental_duration, :rental_rate, :length, :replacement_cost, :rating, :last_update, :special_features, :fulltext), Tuple{Int4Type, TextType, TextType, Int4Type, Int4Type, Int4Type, Int2Type, SQLCompose.DecimalType, Int2Type, SQLCompose.DecimalType, EnumType, SQLCompose.TimestampType, SQLCompose.ArrayType{TextType}, SQLCompose.UnknownType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
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
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Film_Actor <: SQLCompose.RowStruct{RowType{:film_actor, (:actor_id, :film_id, :last_update), Tuple{Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            actor_id
            film_id
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Film_Actor_Extension <: SQLCompose.RowStruct{RowType{:film_actor_extension, (:actor_id, :film_id), Tuple{Int4Type, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            actor_id
            film_id
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Film_Actor_Extension2 <: SQLCompose.RowStruct{RowType{:film_actor_extension2, (:actor_id, :film_id), Tuple{Int4Type, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            actor_id
            film_id
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Film_Category <: SQLCompose.RowStruct{RowType{:film_category, (:film_id, :category_id, :last_update), Tuple{Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            film_id
            category_id
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Film_List <: SQLCompose.RowStruct{RowType{:film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, TextType, TextType, TextType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            fid
            title
            description
            category
            price
            length
            rating
            actors
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Inventory <: SQLCompose.RowStruct{RowType{:inventory, (:inventory_id, :film_id, :store_id, :last_update), Tuple{Int4Type, Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            inventory_id
            film_id
            store_id
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Inventory_Item <: SQLCompose.RowStruct{RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            name
            supplier_id
            price
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Inventory_Item2 <: SQLCompose.RowStruct{RowType{:inventory_item2, (:name, :supplier_ids, :prices), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            name
            supplier_ids
            prices
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Inventory_Item3 <: SQLCompose.RowStruct{RowType{:inventory_item3, (:name, :supplier_ids, :prices, :dt, :item), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}, SQLCompose.TimestampType, RowType{:inventory_item, (:name, :supplier_id, :price), Tuple{TextType, Int4Type, SQLCompose.DecimalType}}}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            name
            supplier_ids
            prices
            dt
            item
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Inventory_Item4 <: SQLCompose.RowStruct{RowType{:inventory_item4, (:name, :supplier_ids, :prices), Tuple{TextType, SQLCompose.ArrayType{Int4Type}, SQLCompose.ArrayType{SQLCompose.DecimalType}}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            name
            supplier_ids
            prices
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Language <: SQLCompose.RowStruct{RowType{:language, (:language_id, :name, :last_update), Tuple{Int4Type, CharType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            language_id
            name
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Nicer_But_Slower_Film_List <: SQLCompose.RowStruct{RowType{:nicer_but_slower_film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, TextType, TextType, TextType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            fid
            title
            description
            category
            price
            length
            rating
            actors
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Payment <: SQLCompose.RowStruct{RowType{:payment, (:payment_id, :customer_id, :staff_id, :rental_id, :amount, :payment_date), Tuple{Int4Type, Int4Type, Int4Type, Int4Type, SQLCompose.DecimalType, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            payment_id
            customer_id
            staff_id
            rental_id
            amount
            payment_date
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Rental <: SQLCompose.RowStruct{RowType{:rental, (:rental_id, :rental_date, :inventory_id, :customer_id, :return_date, :staff_id, :last_update), Tuple{Int4Type, SQLCompose.TimestampType, Int4Type, Int4Type, SQLCompose.TimestampType, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            rental_id
            rental_date
            inventory_id
            customer_id
            return_date
            staff_id
            last_update
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Sales_By_Film_Category <: SQLCompose.RowStruct{RowType{:sales_by_film_category, (:category, :total_sales), Tuple{TextType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            category
            total_sales
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Sales_By_Store <: SQLCompose.RowStruct{RowType{:sales_by_store, (:store, :manager, :total_sales), Tuple{TextType, TextType, SQLCompose.DecimalType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            store
            manager
            total_sales
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Staff <: SQLCompose.RowStruct{RowType{:staff, (:staff_id, :first_name, :last_name, :address_id, :email, :store_id, :active, :username, :password, :last_update, :picture), Tuple{Int4Type, TextType, TextType, Int4Type, TextType, Int4Type, BooleanType, TextType, TextType, SQLCompose.TimestampType, SQLCompose.BlobType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
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
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Staff_List <: SQLCompose.RowStruct{RowType{:staff_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :sid), Tuple{Int4Type, TextType, TextType, TextType, TextType, TextType, TextType, Int4Type}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            id
            name
            address
            var"zip code"
            phone
            city
            country
            sid
        end
    end
    begin
        #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:74 =#
        struct Store <: SQLCompose.RowStruct{RowType{:store, (:store_id, :manager_staff_id, :address_id, :last_update), Tuple{Int4Type, Int4Type, Int4Type, SQLCompose.TimestampType}}}
            #= c:\Users\Rob\.julia\dev\SQLCompose\src\generate\generate.jl:52 =#
            store_id
            manager_staff_id
            address_id
            last_update
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