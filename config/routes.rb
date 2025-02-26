Rails.application.routes.draw do
  post "likes/:url_id/create" => "likes#create"
  post "likes/:url_id/destroy" => "likes#destroy"

  post "goods/:url_id/create" => "goods#create"
  post "goods/:url_id/destroy" => "goods#destroy"

  get "users/index" => "users#index"
  get "users/new" => "users#new"
  post "users/create" => "users#create"

  get "users/:id/edit" => "users#edit"
  get "users/:id/password_change_form" => "users#password_change_form"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  post "users/:id/password_change" => "users#password_change"

  get "users/:id" => "users#show"

  get "urls/index" => "urls#index"
  get "urls/myurl" => "urls#myurl"
  get "urls/genre" => "urls#genre"
  get "urls/like" => "urls#like"
  get "urls/new" => "urls#new"
  post "urls/create" => "urls#create"
  get "urls/genres/:genre" => "urls#genres"

  get "urls/search" => "urls#search"
  post "urls/search_title" => "urls#search_title"
  get "urls/search_result" => "urls#search_result"

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
