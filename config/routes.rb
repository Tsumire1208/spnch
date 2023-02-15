Rails.application.routes.draw do
  devise_for :users
  root to: "chats#index"
  resources :users, only: [:edit, :update]
end
