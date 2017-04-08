Rails.application.routes.draw do
  devise_for :users, skip: [:passwords]
  resources :restaurants
  resources :reviews, only: [:create, :destroy]
  get "/admin_dash", to: "users#admin_dash"
  root to: 'restaurants#index'
end
