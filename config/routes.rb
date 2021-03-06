Rails.application.routes.draw do
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/admin', to: 'pages#admin', as: 'admin'
  get "/autocomplete", to: 'cities#autocomplete'
  resources :countries
  resources :cities
  resources :clubs do
    resources :reviews, only: [:create]
  end
  resources :features, only: [:create, :destroy]
  resources :reviews, only: [:update, :edit, :show, :destroy]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
