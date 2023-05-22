@info "Running reference tests"
@testset "reference" begin
    persons = TableSource(:person, :id => SQLCompose.Int8Type,
        :first_name => SQLCompose.TextType,
        :initials => SQLCompose.TextType,
        :surname => SQLCompose.TextType)
    salaries = TableSource(:salary,
        :person_id => SQLCompose.Int8Type,
        :amount => SQLCompose.Int4Type)

    fullname(p) = p.first_name * " " * p.surname
    salary(p) = reference(salaries, (:person_id,), (p.id,))

    @info "test without reference"
    @testsql (@query persons begin
        join(_, salaries) do p, s
            p.id == s.person_id
        end
        map(_) do p, s
            (person=fullname(p), salary=s.amount)
        end
    end),
    "SELECT CONCAT(p.first_name, ' ', p.surname) AS person, 
        s.amount AS salary FROM person p INNER JOIN salary s ON p.id = s.person_id"

    @info "test with reference"
    @testsql (@query persons begin
        map(_) do p
            (person=fullname(p), salary=salary(p).amount)
        end
    end),
    "SELECT CONCAT(p.first_name, ' ', p.surname) AS person, ref_salary.amount AS salary FROM person p 
        INNER JOIN salary ref_salary ON p.id = ref_salary.person_id"


end

