Rails.application.routes.draw do
  get "likes/index"
  get "urls/index"
  get "urls/new"
  get "urls/edit"
  get "/" => "home#top"
  get "/about" => "home#about"
  get "users/index" => "users#index"
end
