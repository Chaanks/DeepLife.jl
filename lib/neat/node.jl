"""
Node Genes
"""

@enum NodeType INPUT=-1 HIDDEN=0 OUTPUT=1

mutable struct Node
    id::Int
    dtype::NodeType
    activation::ActivationType
    bias::Float64
    connections::Dict{String, Vector{Connection}}
    
    function Node(id::Int, dtype::NodeType, activation::ActivationType=sigmoid, bias::Float64=rand())
        connections = Dict{String, Vector{Connection}}("in" => [], "out" => [])
        new(id, dtype,activation, bias, connections)
    end
    
    function Node(id::Int, dtype::NodeType, activation, bias::Float64, connections)
        # @assert typeof(activation) == ActivationType
        new(id, dtype, activation, bias, connections)
    end
end

Base.copy(n::Node) = Node(n.id, n.dtype, n.activation, n.bias, deepcopy(n.connections))


function get_connection(node::Node, from::Int, to::Int, mode::String)
    for conn in node.connections[mode]
        if conn.input == from && conn.output == to
            return conn
        end
    end
end