class AmbientChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ambient_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def init_time(data)
    initial_time = "%10.6f" % Time.current.to_f
    ActionCable.server.broadcast "ambient_channel", message: :init_time, initial_time: initial_time, key: data['key']
  end

  def start_signal
    time = ("%10.6f" % Time.current.to_f).to_f + 5.0
    ActionCable.server.broadcast "ambient_channel", message: "start", time: time
  end

  def change_color(color)
    ActionCable.server.broadcast "ambient_channel", message: "change_color", color: color
  end
end
