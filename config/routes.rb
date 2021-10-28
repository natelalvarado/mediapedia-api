Rails.application.routes.draw do
  # User Routes
  get "users/me" => "users#show"
  post "/users" => "users#create"
  patch "users/me" => "users#update"
  delete "users/me" => "users#destroy"
  
  #Sessions Route
  post "/sessions" => "sessions#create"
  
  # Media Routes
  get "/media" => "media#index"
  get "media/:id" => "media#show"
  post "/media" => "media#create"
  patch "/media/:id" => "media#update"
  delete "/media/:id" => "media#destroy"
end
