Rails.application.routes.draw do
  get 'cities/index'
  get 'cities/show'
  resources :countries, only: [:show, :index]
  resources :cities, only: [:show, :index]
  resources :clubs, except: [:index]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
