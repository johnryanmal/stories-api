Rails.application.routes.draw do
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/stories" => "stories#index"
  get "/stories/:id" => "stories#show"
end
