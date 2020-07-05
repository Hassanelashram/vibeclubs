Rails.application.routes.draw do
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources :countries, only: [:show, :index]
  resources :cities, only: [:show, :index]
  resources :clubs
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
