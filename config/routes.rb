Rails.application.routes.draw do
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  get "users/:id" => "users#show"

  get "urls/index" => "urls#index"
  get "urls/new" => "urls#new"
  post "urls/create" => "urls#create"
  get "urls/:id/edit" => "urls#edit"
  post "urls/:id/update" => "urls#update"
  post "urls/:id/destroy" => "urls#destroy"
  get "urls/:id" => "urls#show"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  get "/" => "home#top"
  get "/about" => "home#about"
end
