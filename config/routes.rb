Rails.application.routes.draw do
  root "stories#index"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/stories" => "stories#index"
  get "/stories/user" => "stories#index_user"
  post "/stories" => "stories#create"
  get "/stories/:id" => "stories#show"
  patch "/stories/:id" => "stories#update"
  delete "/stories/:id" => "stories#destroy"
end
