App.ambient = App.cable.subscriptions.create "AmbientChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data);
    if data["message"] == "start"
      App.playSound();

  start_signal: ->
    @perform 'start_signal'
