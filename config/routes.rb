Rails.application.routes.draw do
  # User Routes
  get "users/:id" => "users#show"
  post "/users" => "users#create"
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"
  
  #Sessions Route
  post "/session" => "sessions#create"
  
  # Media Routes
  get "/media" => "media#index"
  get "media/:id" => "media#show"
  post "/media" => "media#create"
  patch "/media/:id" => "media#update"
  delete "/media/:id" => "media#destroy"
end
