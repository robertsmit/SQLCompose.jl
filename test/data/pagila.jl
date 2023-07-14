module Pagila
#= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:13 =#
#= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:14 =#
using SQLCompose
#= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:15 =#
begin
    #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:89 =#
    export Actor, Actor_Info, Address, Category, City, Country, Customer, Customer_List, Film, Film_Actor, Film_Category, Film_List, Inventory, Language, Nicer_But_Slower_Film_List, Payment, Rental, Rental_Report, Staff, Staff_List, Store
    export city_of, country_of, store_of, address_of, language_of, original_language_of, actor_of, film_of, category_of, film_of, film_of, store_of, inventory_of, customer_of, staff_of, store_of, address_of, manager_staff_of, address_of
    export all_address_of, all_city_of, all_customer_of, all_customer_of, all_film_of, all_original_language_of, all_film_actor_of, all_film_actor_of, all_film_category_of, all_film_category_of, all_inventory_of, all_inventory_of, all_rental_of, all_rental_of, all_rental_of, all_staff_of, all_staff_of, all_manager_staff_of, all_store_of
    #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:90 =#
    struct Actor <: SQLCompose.RowStruct{RowType{:actor, (:actor_id, :first_name, :last_name, :last_update), Tuple{Int4Type, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        actor_id
        first_name
        last_name
        last_update
    end
    struct Actor_Info <: SQLCompose.RowStruct{RowType{:actor_info, (:actor_id, :first_name, :last_name, :film_info), Tuple{Int4Type, SQLCompose.VarCharType, SQLCompose.VarCharType, TextType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        actor_id
        first_name
        last_name
        film_info
    end
    struct Address <: SQLCompose.RowStruct{RowType{:address, (:address_id, :address, :address2, :district, :city_id, :postal_code, :phone, :last_update), Tuple{Int4Type, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.VarCharType, Int2Type, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        address_id
        address
        address2
        district
        city_id
        postal_code
        phone
        last_update
    end
    struct Category <: SQLCompose.RowStruct{RowType{:category, (:category_id, :name, :last_update), Tuple{Int4Type, SQLCompose.VarCharType, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        category_id
        name
        last_update
    end
    struct City <: SQLCompose.RowStruct{RowType{:city, (:city_id, :city, :country_id, :last_update), Tuple{Int4Type, SQLCompose.VarCharType, Int2Type, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        city_id
        city
        country_id
        last_update
    end
    struct Country <: SQLCompose.RowStruct{RowType{:country, (:country_id, :country, :last_update), Tuple{Int4Type, SQLCompose.VarCharType, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        country_id
        country
        last_update
    end
    struct Customer <: SQLCompose.RowStruct{RowType{:customer, (:customer_id, :store_id, :first_name, :last_name, :email, :address_id, :activebool, :create_date, :last_update, :active), Tuple{Int4Type, Int2Type, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.VarCharType, Int2Type, BooleanType, SQLCompose.DateType, SQLCompose.TimestampType, Int2Type}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
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
    struct Customer_List <: SQLCompose.RowStruct{RowType{:customer_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :notes, :sid), Tuple{Int4Type, TextType, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.VarCharType, TextType, Int2Type}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
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
    struct Film <: SQLCompose.RowStruct{RowType{:film, (:film_id, :title, :description, :release_year, :language_id, :original_language_id, :rental_duration, :rental_rate, :length, :replacement_cost, :rating, :last_update, :special_features, :fulltext, :revenue_projection), Tuple{Int4Type, SQLCompose.VarCharType, TextType, Int4Type, Int2Type, Int2Type, Int2Type, SQLCompose.DecimalType, Int2Type, SQLCompose.DecimalType, EnumType, SQLCompose.TimestampType, SQLCompose.ArrayType{TextType}, SQLCompose.UnknownType, SQLCompose.DecimalType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
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
        revenue_projection
    end
    struct Film_Actor <: SQLCompose.RowStruct{RowType{:film_actor, (:actor_id, :film_id, :last_update), Tuple{Int2Type, Int2Type, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        actor_id
        film_id
        last_update
    end
    struct Film_Category <: SQLCompose.RowStruct{RowType{:film_category, (:film_id, :category_id, :last_update), Tuple{Int2Type, Int2Type, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        film_id
        category_id
        last_update
    end
    struct Film_List <: SQLCompose.RowStruct{RowType{:film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, SQLCompose.VarCharType, TextType, SQLCompose.VarCharType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        fid
        title
        description
        category
        price
        length
        rating
        actors
    end
    struct Inventory <: SQLCompose.RowStruct{RowType{:inventory, (:inventory_id, :film_id, :store_id, :last_update), Tuple{Int4Type, Int2Type, Int2Type, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        inventory_id
        film_id
        store_id
        last_update
    end
    struct Language <: SQLCompose.RowStruct{RowType{:language, (:language_id, :name, :last_update), Tuple{Int4Type, CharType, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        language_id
        name
        last_update
    end
    struct Nicer_But_Slower_Film_List <: SQLCompose.RowStruct{RowType{:nicer_but_slower_film_list, (:fid, :title, :description, :category, :price, :length, :rating, :actors), Tuple{Int4Type, SQLCompose.VarCharType, TextType, SQLCompose.VarCharType, SQLCompose.DecimalType, Int2Type, EnumType, TextType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        fid
        title
        description
        category
        price
        length
        rating
        actors
    end
    struct Payment <: SQLCompose.RowStruct{RowType{:payment, (:payment_id, :customer_id, :staff_id, :rental_id, :amount, :payment_date), Tuple{Int4Type, Int2Type, Int2Type, Int4Type, SQLCompose.DecimalType, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        payment_id
        customer_id
        staff_id
        rental_id
        amount
        payment_date
    end
    struct Rental <: SQLCompose.RowStruct{RowType{:rental, (:rental_id, :inventory_id, :customer_id, :staff_id, :last_update, :rental_period), Tuple{Int4Type, Int4Type, Int2Type, Int2Type, SQLCompose.TimestampType, SQLCompose.RangeType{SQLCompose.TimestampType}}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        rental_id
        inventory_id
        customer_id
        staff_id
        last_update
        rental_period
    end
    struct Rental_Report <: SQLCompose.RowStruct{RowType{:rental_report, (:report,), Tuple{SQLCompose.JSONType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        report
    end
    struct Staff <: SQLCompose.RowStruct{RowType{:staff, (:staff_id, :first_name, :last_name, :address_id, :email, :store_id, :active, :username, :password, :last_update, :picture), Tuple{Int4Type, SQLCompose.VarCharType, SQLCompose.VarCharType, Int2Type, SQLCompose.VarCharType, Int2Type, BooleanType, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.TimestampType, SQLCompose.BlobType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
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
    struct Staff_List <: SQLCompose.RowStruct{RowType{:staff_list, (:id, :name, :address, Symbol("zip code"), :phone, :city, :country, :sid), Tuple{Int4Type, TextType, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.VarCharType, SQLCompose.VarCharType, Int2Type}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        id
        name
        address
        var"zip code"
        phone
        city
        country
        sid
    end
    struct Store <: SQLCompose.RowStruct{RowType{:store, (:store_id, :manager_staff_id, :address_id, :last_update), Tuple{Int4Type, Int2Type, Int2Type, SQLCompose.TimestampType}}}
        #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:49 =#
        store_id
        manager_staff_id
        address_id
        last_update
    end
    #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:91 =#
    city_of(address::Address) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(City, (:city_id,), (address.city_id,))
        end
    country_of(city::City) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Country, (:country_id,), (city.country_id,))
        end
    store_of(customer::Customer) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Store, (:store_id,), (customer.store_id,))
        end
    address_of(customer::Customer) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Address, (:address_id,), (customer.address_id,))
        end
    language_of(film::Film) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Language, (:language_id,), (film.language_id,))
        end
    original_language_of(film::Film) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Language, (:language_id,), (film.original_language_id,))
        end
    actor_of(film_actor::Film_Actor) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Actor, (:actor_id,), (film_actor.actor_id,))
        end
    film_of(film_actor::Film_Actor) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Film, (:film_id,), (film_actor.film_id,))
        end
    category_of(film_category::Film_Category) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Category, (:category_id,), (film_category.category_id,))
        end
    film_of(film_category::Film_Category) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Film, (:film_id,), (film_category.film_id,))
        end
    film_of(inventory::Inventory) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Film, (:film_id,), (inventory.film_id,))
        end
    store_of(inventory::Inventory) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Store, (:store_id,), (inventory.store_id,))
        end
    inventory_of(rental::Rental) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Inventory, (:inventory_id,), (rental.inventory_id,))
        end
    customer_of(rental::Rental) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Customer, (:customer_id,), (rental.customer_id,))
        end
    staff_of(rental::Rental) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Staff, (:staff_id,), (rental.staff_id,))
        end
    store_of(staff::Staff) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Store, (:store_id,), (staff.store_id,))
        end
    address_of(staff::Staff) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Address, (:address_id,), (staff.address_id,))
        end
    manager_staff_of(store::Store) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Staff, (:staff_id,), (store.manager_staff_id,))
        end
    address_of(store::Store) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:63 =#
            SQLCompose.reference(Address, (:address_id,), (store.address_id,))
        end
    #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:92 =#
    all_address_of(city::City) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Address, (:city_id,), (city.city_id,))
        end
    all_city_of(country::Country) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(City, (:country_id,), (country.country_id,))
        end
    all_customer_of(store::Store) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Customer, (:store_id,), (store.store_id,))
        end
    all_customer_of(address::Address) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Customer, (:address_id,), (address.address_id,))
        end
    all_film_of(language::Language) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Film, (:language_id,), (language.language_id,))
        end
    all_original_language_of(language::Language) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Film, (:original_language_id,), (language.language_id,))
        end
    all_film_actor_of(actor::Actor) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Film_Actor, (:actor_id,), (actor.actor_id,))
        end
    all_film_actor_of(film::Film) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Film_Actor, (:film_id,), (film.film_id,))
        end
    all_film_category_of(category::Category) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Film_Category, (:category_id,), (category.category_id,))
        end
    all_film_category_of(film::Film) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Film_Category, (:film_id,), (film.film_id,))
        end
    all_inventory_of(film::Film) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Inventory, (:film_id,), (film.film_id,))
        end
    all_inventory_of(store::Store) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Inventory, (:store_id,), (store.store_id,))
        end
    all_rental_of(inventory::Inventory) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Rental, (:inventory_id,), (inventory.inventory_id,))
        end
    all_rental_of(customer::Customer) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Rental, (:customer_id,), (customer.customer_id,))
        end
    all_rental_of(staff::Staff) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Rental, (:staff_id,), (staff.staff_id,))
        end
    all_staff_of(store::Store) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Staff, (:store_id,), (store.store_id,))
        end
    all_staff_of(address::Address) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Staff, (:address_id,), (address.address_id,))
        end
    all_manager_staff_of(staff::Staff) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Store, (:manager_staff_id,), (staff.staff_id,))
        end
    all_store_of(address::Address) = begin
            #= /Users/rob/.julia/dev/SQLCompose/src/generate/generate.jl:70 =#
            SQLCompose.reference(Store, (:address_id,), (address.address_id,))
        end
end
end