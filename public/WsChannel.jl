module WsChannel

using Genie.WebChannels, Genie.Router, Genie.Helpers


function subscribe()
  WebChannels.subscribe(wsclient(@params), "mychannel")
  "OK"
end

function ping()
  WebChannels.message(wsclient(@params), "pong")
  "TEST"
end

end
