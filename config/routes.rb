Rails.application.routes.draw do
  resources :restaurants
  resources :reviews, only: [:create]
  root 'restaurants#index'
end
