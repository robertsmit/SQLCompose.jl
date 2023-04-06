@info "Running lateral tests"
@testset "lateral" begin
    persontable = TableDefinition(:person, :id => SQLCompose.Int8Type, :first_name => SQLCompose.TextType, :initials => SQLCompose.TextType, :surname => SQLCompose.TextType)
    salarytable = TableDefinition(:salary, :person_id => SQLCompose.Int8Type, :amount => SQLCompose.Int4Type)

    fullname(p) = p.first_name * " " * p.surname
    personsalary(p) = lateral(salarytable, (:person_id,), (p.id,))

    @info "test without lateral"
    @testsql map((p, s) -> (person=fullname(p), salary=s.amount),
        join((p, s) -> p.id == s.person_id,
            query(persontable), query(salarytable))),
    "SELECT CONCAT(p.first_name, ' ', p.surname) AS person, 
        s.amount AS salary FROM person p INNER JOIN salary s ON p.id = s.person_id"

    @info "test with lateral"
    @testsql map(p -> (person=fullname(p), salary=personsalary(p).amount), query(persontable)),
    "SELECT CONCAT(p.first_name, ' ', p.surname) AS person, lat_salary.amount AS salary FROM person p 
        INNER JOIN salary lat_salary ON p.id = lat_salary.person_id"
end

