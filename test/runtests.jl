using DeepLife, DeepLife.Neat
using Test


@testset "DeepLife.jl" begin

    @testset "Neat" begin

        @testset "Connection" begin
            conn1 = Connection(1, 2)
            conn2 = copy(conn1)
            @test conn1 != conn2
        end

        @testset "Node" begin
            conns = Dict{String, Vector{Connection}}("in" => [], "out" => [])
            n1 = Node(1, INPUT::NodeType)
            n2 = copy(n1)
            @test n1 != n2
            #@test_throws AssertionError Node(1, INPUT::NodeType, "sigmoid", 1., conns)


        end

        @testset "Network" begin
            conf = Dict(
                "num_inputs" => 2,
                "num_outputs" => 1
            )
        
            net = Network(conf)
            #println(net)

        end
    end
end
