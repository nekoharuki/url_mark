Rails.application.routes.draw do
  post "urls/create" => "urls#create"
  get "likes/index"
  get "urls/index"
  get "urls/new" => "urls#new"
  get "urls/edit"
  get "/" => "home#top"
  get "/about" => "home#about"
  get "users/index" => "users#index"
end
