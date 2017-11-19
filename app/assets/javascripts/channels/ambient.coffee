App.ambient = App.cable.subscriptions.create "AmbientChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data)

    switch data["message"]
      when "start"
        App.playSound(data["time"]);

      when "change_color"
        console.log('read')
        changeColor(data.color.r, data.color.g, data.color.b)
        if !typeof changeColor == "function"
          changeColor(data.color.r, data.color.g, data.color.b)
        else
          console.log('n~~~')
      when "init_time"
        setInitialTime(data["initial_time"])


  init_time: ->
    @perform 'init_time'

  start_signal: ->
    @perform 'start_signal'

  change_color: (r,g,b) ->
    @perform 'change_color', {r: r, g: g, b: b}
