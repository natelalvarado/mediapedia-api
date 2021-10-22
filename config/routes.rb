Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sesssion" => "sessions#create"
end
