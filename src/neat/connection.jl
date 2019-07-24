"""
Connection Genes
"""

mutable struct Connection
    input::Int
    output::Int
    weight::Float64
    disabled::Bool
    
    function Connection(input::Int, output::Int, weight::Float64=rand(), disabled::Bool=false)
        new(input, output, weight, disabled)
    end
end

Base.copy(c::Connection) = Connection(c.input, c.output, c.weight, c.disabled)