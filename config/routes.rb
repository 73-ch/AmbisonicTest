Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#home"
  mount ActionCable.server => '/cable'

  get "home/:file_name" => "home#home"

  get "webgl" => "home#webgl"

  get "control" => "home#control"

  get "date" => "home#date"
end
