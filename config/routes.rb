Rails.application.routes.draw do
  get "words/new"
  get "words/show"
  get "categories/new"
  get "categories/show"
  get "activities/new"
  get "activities/show"
  get "lessons/new"
  get "lessons/show"
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
end
