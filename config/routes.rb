Rails.application.routes.draw do
  root "stories#index"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/stories" => "stories#index"
  post "/stories" => "stories#create"
  get "/stories/:id" => "stories#show"
  patch "/stories/:id" => "stories#update"
  delete "/stories/:id" => "stories#destroy"
end
