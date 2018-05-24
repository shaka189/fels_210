Rails.application.routes.draw do
  root "static_pages#home"

  resources :words, only: %i(index)
  resources :categories, only: %i(index show) do
    resources :lessons, only: %i(create)
  end
  resources :activities, only: %i(index show)
  resources :lessons, only: %i(index show update)
  resources :relationships,       only: [:create, :destroy]

  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  namespace :admin do
    root "admin#index"
    resources :users, except: %i(show)
    resources :lessons, except: %i(show)
    resources :words, except: %i(show)
    resources :categories
    resources :activities
  end
end
