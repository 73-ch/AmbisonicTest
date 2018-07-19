module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identified_by :seat_num
    #
    # def connect
    #   self.connected_device = set_connected_device
    # end
    #
    # protected
    # def set_connected_device
    #   session[:seat_num]
    # end
  end
end
