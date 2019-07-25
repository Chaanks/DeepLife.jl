module DeepLife

#push!(LOAD_PATH, @__DIR__)

using Revise


include("neat/Neat.jl")
using .Neat
export sigmoid
export Connection
export Node, NodeType
export Network


lol = function ()
    println("debug")

    conf = Dict(
        "num_inputs" => 2,
        "num_outputs" => 1
    )

    net = Network(conf)
    n = Node(5, INPUT::NodeType)
    @show n
    Neat.add_node!(net, n)
    
    println(net)
    #conn = Connection(1, 2)
    #add_connection!(n1, conn)
end


end # module