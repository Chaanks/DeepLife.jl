module DeepLife

#push!(LOAD_PATH, @__DIR__)

using Revise


include("neat/Neat.jl")
using .Neat
export sigmoid
export Connection
export Node, NodeType


end # module
