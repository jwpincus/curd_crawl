Rails.application.routes.draw do
  devise_for :users
  resources :restaurants
  resources :reviews, only: [:create]
  root to: 'restaurants#index'
end
