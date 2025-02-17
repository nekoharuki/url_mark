Rails.application.routes.draw do
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  get "users/:id" => "users#show"

  post "urls/create" => "urls#create"
  get "urls/index" => "urls#index"
  get "urls/new" => "urls#new"
  post "urls/:id/destroy" => "urls#destroy"
  post "urls/:id/update" => "urls#update"
  get "urls/:id/edit" => "urls#edit"
  get "urls/:id" => "urls#show"

  get "/" => "home#top"
  get "/about" => "home#about"
  get "users/index" => "users#index"
end
