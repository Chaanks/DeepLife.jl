module Neat


export sigmoid
export Connection
export Node, NodeType, INPUT

include("activation.jl")
include("connection.jl")
include("node.jl")


end # module