Rails.application.routes.draw do
  
  root "fishes#index"

  resources :users
  
  get "signup" => "users#new"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users" => "users#new"
  post "users/:id/destroy" => "users#destroy"
  
end
