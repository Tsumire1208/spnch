Rails.application.routes.draw do
  devise_for :users
  get 'top/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :list, only: [:new, :create, :edit, :update, :destroy]do
    resources :card, except: [:index]
  end
  resources :rooms, only: [:new, :create, :destroy] do
    resources :chats, only: [:index, :create]
  end
end
