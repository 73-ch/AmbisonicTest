class AmbientChannel < ApplicationCable::Channel
  OFF_SET = 1529100000

  def subscribed
    stream_from "ambient_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def init_time(data)
    time = Time.current
    initial_time = (time.to_f - OFF_SET).to_s.match(/.*\./).to_s + time.nsec.to_s
    logger.info initial_time
    ActionCable.server.broadcast "ambient_channel", message: :init_time, initial_time: initial_time, key: data['key']
    time = Time.current
    initial_time = (time.to_f - OFF_SET).to_s.match(/.*\./).to_s + time.nsec.to_s
    logger.info initial_time
  end

  def start_signal
    time = Time.current + 5.0
    time = (time.to_f - OFF_SET).to_s.match(/.*\./).to_s + time.nsec.to_s
    ActionCable.server.broadcast "ambient_channel", message: "start", time: time
  end

  def change_color(color)
    ActionCable.server.broadcast "ambient_channel", message: "change_color", color: color
  end
end
