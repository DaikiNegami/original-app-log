Rails.application.routes.draw do
  devise_for :users
  root to:'diaries#index'
  resources :diaries, only: [:index, :new, :create, :show] do
    resources :comments, only: :create
  end
  
  resources :users, only: :show
end
