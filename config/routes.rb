Rails.application.routes.draw do
  resource :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]
end
