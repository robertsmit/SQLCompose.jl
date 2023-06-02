#=
ast:
- Julia version: 
- Author: Rob
- Date: 2022-04-11
=#

@info "Running Types tests"

import SQLCompose: sqltypeclassof

@testset "Types" begin
    @test sqltypeclassof(1) === SQLCompose.Int8Type
    @test sqltypeclassof("") === SQLCompose.TextType


    @testsql SQLCompose.CharType(1) "char(1)"
end