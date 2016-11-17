Rails.application.routes.draw do
  namespace :admin do
    root "static_pages#home"
    resources :categories
    resources :products
    resources :suggestions
    resources :orders
  end
  root "static_pages#home"
  resources :suggestions
  devise_for :users, controllers: {omniauth_callbacks: "callbacks",
    registrations: "users/registrations"}
  resources :products, only: [:index, :show]
  resources :carts
  resources :products, only: [:index, :show] do
    resources :rates, except: [:destroy]
    resources :comments
  end
  resources :rates, only: [:create, :update]
  resources :comments
  resources :orders
end
