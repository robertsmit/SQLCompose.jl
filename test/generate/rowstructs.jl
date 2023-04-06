@info "Running RowStruct tests"

using SQLCompose.Generate
using SQLCompose: lateral, table, RowType
using Test: @testset, @test

@eval $(queries_expression((
      RelationType(RowType{:person,(:person_id, :firstname, :surname, :manager_id),Tuple{UUIDType,TextType,TextType,UUIDType}},
         (ForeignKey(:person, (:person_id,), (:manager_id,)),)),
      RelationType(RowType{:role,(:role_id, :person_id, :rolename),Tuple{UUIDType,UUIDType,TextType}}),
      RelationType(SQLCompose.RowType{:salary,(:salary_id, :person_id, :amount),Tuple{UUIDType,UUIDType,Int4Type}},
         (ForeignKey(:person, (:person_id,)),))); rowstruct_typename = name -> name |> string |> titlecase |> Symbol))

fullname(p::Person) = p.firstname * " " * p.surname

salaries_of(p::Person) = lateral(Salary, (:person_id,), (p.person_id,))

@testset "Row Struct: generate" begin
   @test SQLCompose.name(table(Person)) == :person
   @test SQLCompose.field_names(Person) == (:person_id, :firstname, :surname, :manager_id)
   #@testsql map(p -> fullname(p), query(Person)) "SELECT CONCAT(p.firstname, ' ', p.surname) AS elem1 FROM person p"
   @test fullname(Person(1, "John", "Do", 3)) == "John Do"

   @testsql map(query(Person)) do p
      (person=p, manager=fullname(manager_of(p)))
   end "SELECT p.person_id AS person_person_id, p.firstname AS person_firstname, p.surname AS person_surname, p.manager_id AS person_manager_id, 
            CONCAT(lat_person.firstname, ' ', lat_person.surname) AS manager FROM person p 
            INNER JOIN person lat_person ON p.manager_id = lat_person.person_id"
        

   salaries_higher_then = join(query(Person), query(Salary)) do p, s
      salaries_of(p).amount < s.amount
   end
   @testsql salaries_higher_then "SELECT * FROM person p INNER JOIN salary lat_salary ON p.person_id = lat_salary.person_id INNER JOIN salary s ON lat_salary.amount < s.amount"

   @testsql map(salaries_higher_then) do p, s
      (person=fullname(p), salary=salaries_of(p).amount, person_with_more=fullname(person_of(s)), salary_more=s.amount)
   end "SELECT CONCAT(p.firstname, ' ', p.surname) AS person, lat_salary.amount AS salary, 
         CONCAT(lat_person.firstname, ' ', lat_person.surname) AS person_with_more, s.amount AS salary_more FROM person p 
            INNER JOIN salary lat_salary ON p.person_id = lat_salary.person_id 
            INNER JOIN salary s ON lat_salary.amount < s.amount 
            INNER JOIN person lat_person ON s.person_id = lat_person.person_id"
end
