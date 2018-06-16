class AmbientChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ambient_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def init_time(data)
    time = Time.current
    initial_time = time.to_f.to_s.match(/.*\./).to_s + time.nsec.to_s
    ActionCable.server.broadcast "ambient_channel", message: :init_time, initial_time: initial_time, key: data['key']
  end

  def start_signal
    time = Time.current + 5.0
    time = time.to_f.to_s.match(/.*\./).to_s + time.nsec.to_s
    ActionCable.server.broadcast "ambient_channel", message: "start", time: time
  end

  def change_color(color)
    ActionCable.server.broadcast "ambient_channel", message: "change_color", color: color
  end
end
