module DeepLife

push!(LOAD_PATH, @__DIR__)

using Revise
using Genie
using Genie.Router, Genie.WebChannels, Genie.Configuration


include("neat/Neat.jl")
using .Neat
export sigmoid
export Connection
export Node, NodeType
export Network


server = function ()
    ENV["GENIE_ENV"] = "dev"
    include(joinpath(Genie.ENV_PATH, ENV["GENIE_ENV"] * ".jl"))
    
    route("/mychannel/subscribe") do 
        # logic here to render your single web page
        serve_static_file("welcome.html")
    end
    
    route("/hello") do
        "Hello - Welcome to Genie!"
    end
    
    channel("/mychannel/subscribe") do 
        WebChannels.subscribe(@params(:WS_CLIENT), "mychannel")
        @show "Subscription OK"
    end
      
    function do_your_stuff_here()
        # push updates
        WebChannels.message("mychannel", json_payload)
    end
        
    Genie.startup()
    Genie.run()

end

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