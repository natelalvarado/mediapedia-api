Rails.application.routes.draw do
  get "users/:id" => "users#show"
  post "/users" => "users#create"
  post "/session" => "sessions#create"
  
  get "media" => "media#index"
  post "/media" => "media#create"
end
