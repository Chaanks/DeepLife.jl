using Genie.Router, Genie.WebChannels

route("/") do
  serve_static_file("welcome.html")
end

route("/error500") do
  error_500("Something went wrong")
end

route("/error404") do
  error_404("the page you want")
end


route("/mychannel/subscribe") do
  serve_static_file("test.html")
end

channel("/mychannel/subscribe") do 
  WebChannels.subscribe(@params(:WS_CLIENT), "mychannel")
  @show "Subscription OK"
end

channel("/mychannel/ping") do 
  WebChannels.message(@params(:WS_CLIENT), "pong")
  @show "pong OK"
end

function do_your_stuff_here()
  # push updates
  WebChannels.message("mychannel", json_payload)
end