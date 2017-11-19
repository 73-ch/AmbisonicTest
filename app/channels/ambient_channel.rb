class AmbientChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ambient_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def init_time
    initial_time = DateTime.now()
    ActionCable.server.broadcast "ambient_channel", message: :init_time, initial_time: initial_time
  end

  def start_signal
    time = DateTime.now() + 5.second
    ActionCable.server.broadcast "ambient_channel", message: "start", time: time
  end

  def change_color(color)
    ActionCable.server.broadcast "ambient_channel", message: "change_color", color: color
  end
end
