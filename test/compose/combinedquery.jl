#=
map:
- Julia version: 
- Author: Rob
- Date: 2022-04-22
=#
using SQLCompose


@info "Running combined query by tests"
@testset "combined queries" begin
    persons = TableDefinition(:persons, :person_id => UUIDType, :surname => TextType)
    members = TableDefinition(:members, :member_id => UUIDType, :name => TextType)
    aliens = TableDefinition(:aliens, :alien_id => UUIDType, :name => TextType)
    @info "union tables"
    @test string(vcat(query(persons), query(members))) == "SELECT p.person_id, p.surname FROM persons p UNION SELECT m.member_id, m.name FROM members m"
    @info "union all tables"
    @test string(vcat(query(persons), query(members); unique = false)) == "SELECT p.person_id, p.surname FROM persons p UNION ALL SELECT m.member_id, m.name FROM members m"
    @info "union 3 tables"
    @test string(vcat(query(persons), query(members), query(aliens))) == "SELECT p.person_id, p.surname FROM persons p UNION SELECT m.member_id, m.name FROM members m UNION SELECT a.alien_id, a.name FROM aliens a"
    @info "intersect tables"
    @test string(intersect(query(persons), query(members))) == "SELECT p.person_id, p.surname FROM persons p INTERSECT SELECT m.member_id, m.name FROM members m"
    @info "subtract tables"
    @test string(setdiff(query(persons), query(members))) == "SELECT p.person_id, p.surname FROM persons p EXCEPT SELECT m.member_id, m.name FROM members m"
    @info "multiple combination types"
    @test string(vcat(query(aliens), setdiff(query(persons), query(members)))) == "SELECT a.alien_id, a.name FROM aliens a UNION (SELECT p.person_id, p.surname FROM persons p EXCEPT SELECT m.member_id, m.name FROM members m)"
    @warn "use array literals as values"
end