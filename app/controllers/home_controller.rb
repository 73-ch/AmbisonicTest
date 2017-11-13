class HomeController < ApplicationController
  def home
    @file_name = params[:file_name]
  end
end
