Rails.application.routes.draw do
  root "static_pages#home"
  resources :words, only: %i(index show)
  resources :categories, only: %i(index show)
  resources :activities, only: %i(index show)
  resources :lessons, only: %i(index show)
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
end
