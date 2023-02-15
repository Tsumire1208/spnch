Rails.application.routes.draw do
  devise_for :users
  get 'top/index'
  root to: "chats#index"
  resources :users, only: [:edit, :update]
  resources :list, only: [:new, :create, :edit, :update, :destroy]do
    resources :card, only: [:new, :create, :show, :edit, :update, :destroy]
  end
end
