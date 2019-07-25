sigmoid(x::Real) = inv(one(x) + exp(-x))
binary_step(x::Real) = x < 0 ? 0 : 1

ActivationType = Union{typeof(sigmoid), typeof(binary_step)}
