module DeepLife
using Genie, Genie.Router, Genie.Renderer, Genie.AppServer

function main()
  Base.eval(Main, :(const UserApp = DeepLife))

  include("../genie.jl")

  Base.eval(Main, :(const Genie = DeepLife.Genie))
  Base.eval(Main, :(using Genie))
end

main()

end
