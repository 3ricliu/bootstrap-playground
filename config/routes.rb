Rails.application.routes.draw do
  root to: 'posts#index'

  resources :users, only: [:new, :create]
  resources :posts

  get 'home', to: 'posts#index'

  resource :session, only: [:new, :create, :destroy]
end
