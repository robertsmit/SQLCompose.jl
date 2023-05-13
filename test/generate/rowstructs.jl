@info "Running RowStruct tests"

@eval $(queries_expression((
      RelationType(RowType{:person,(:person_id, :firstname, :surname, :manager_id),Tuple{UUIDType,TextType,TextType,UUIDType}},
         (ForeignKey(:person, (:person_id,), (:manager_id,)),), (:person_id,)),
      RelationType(RowType{:role,(:role_id, :person_id, :rolename),Tuple{UUIDType,UUIDType,TextType}}),
      RelationType(SQLCompose.RowType{:salary,(:salary_id, :person_id, :amount),Tuple{UUIDType,UUIDType,Int4Type}},
         (ForeignKey(:person, (:person_id,)),), (:salary_id,)));
   typename=name -> name |> string |> titlecase |> Symbol))

fullname(p::Person) = p.firstname * " " * p.surname

@testset "Row Struct: generate" begin
   @test fieldnames(Person) == (:person_id, :firstname, :surname, :manager_id)
   #@testsql map(p -> fullname(p), query(Person)) "SELECT CONCAT(p.firstname, ' ', p.surname) AS elem1 FROM person p"
   @test fullname(Person(1, "John", "Do", 3)) == "John Do"

   @testsql map(Person) do p
      (person=p, manager=fullname(manager_of(p)))
   end "SELECT p.person_id AS person_person_id, p.firstname AS person_firstname, p.surname AS person_surname, p.manager_id AS person_manager_id, 
            CONCAT(ref_person.firstname, ' ', ref_person.surname) AS manager FROM person p 
            INNER JOIN person ref_person ON p.manager_id = ref_person.person_id"


   salaries_higher_then = join(query(Person), query(Salary)) do p, s
      all_salary_of(p).amount < s.amount
   end
   @testsql salaries_higher_then "SELECT * FROM person p INNER JOIN salary ref_salary ON p.person_id = ref_salary.person_id INNER JOIN salary s ON ref_salary.amount < s.amount"

   @testsql map(salaries_higher_then) do p, s
      (person=fullname(p), salary=all_salary_of(p).amount, person_with_more=fullname(person_of(s)), salary_more=s.amount)
   end "SELECT CONCAT(p.firstname, ' ', p.surname) AS person, ref_salary.amount AS salary, 
         CONCAT(ref_person.firstname, ' ', ref_person.surname) AS person_with_more, s.amount AS salary_more FROM person p 
            INNER JOIN salary ref_salary ON p.person_id = ref_salary.person_id 
            INNER JOIN salary s ON ref_salary.amount < s.amount 
            INNER JOIN person ref_person ON s.person_id = ref_person.person_id"
end
