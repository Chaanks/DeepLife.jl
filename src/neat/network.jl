"""
Phenotype
"""


mutable struct Network
    nodes::Dict{Int, Node}
    input_id::Array
    hidden_id::Array
    output_id::Array

    
    function Network(config)
        println("build")
        
        nodes = Dict{Int, Node}()
    
        num_inputs = config["num_inputs"]
        num_outputs = config["num_outputs"]
    
        net = new(nodes, [], [], [])
        
        for i = 1:num_inputs
            add_node!(net, Node(i, INPUT::NodeType))
            for j = num_inputs+1:num_outputs+num_inputs
                if i == 1
                    add_node!(net, Node(j, OUTPUT::NodeType))
                end
                add_connection!(net, Connection(i, j))
            end
        end
        return net
    end

end


function add_node!(net::Network, node::Node)
    @assert !haskey(net.nodes, node.id) "ID already used"
    net.nodes[node.id] = node

    if node.dtype == INPUT
        push!(net.input_id, node.id)
    elseif node.dtype == OUTPUT
        push!(net.output_id, node.id)
    else
        push!(net.hidden_id, node.id)
    end
end

function add_connection!(net::Network, conn::Connection)
    push!(net.nodes[conn.input].connections["in"], conn)
    push!(net.nodes[conn.output].connections["out"], conn)
end