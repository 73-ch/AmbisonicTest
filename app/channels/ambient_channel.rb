class AmbientChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ambient_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def start_signal
    ActionCable.server.broadcast "ambient_channel", message: "start"
  end

  def change_color(color)
    ActionCable.server.broadcast "ambient_channel", message: "change_color", color: color
  end
end
