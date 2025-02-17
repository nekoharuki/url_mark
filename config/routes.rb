Rails.application.routes.draw do
  post "urls/create" => "urls#create"
  get "likes/index"
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
