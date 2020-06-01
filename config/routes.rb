Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :projects, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :offers, only: [:index, :create]
  resources :notifications, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
