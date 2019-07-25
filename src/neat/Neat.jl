module Neat


export sigmoid
export Connection
export Node, NodeType, INPUT
export Network

include("activation.jl")
include("connection.jl")
include("node.jl")
include("network.jl")


end # module