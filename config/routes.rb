Rails.application.routes.draw do
  devise_for :users
  get 'top/index'
  root to: "chats#index"
  resources :users, only: [:edit, :update]
  resources :list, only: [:new, :create, :edit, :update, :destroy]

end
