Rails.application.routes.draw do
  get "/" => "home#top"
  get "users/index" => "users#index"
end
