Rails.application.routes.draw do
  get "users/:id" => "users#show"
  post "/users" => "users#create"
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"
  
  post "/session" => "sessions#create"

  get "/media" => "media#index"
  get "media/:id" => "media#show"
  post "/media" => "media#create"
  patch "/media/:id" => "media#update"
  delete "/media/:id" => "media#destroy"

end
