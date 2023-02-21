Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get :dashboard, to: "dashboard#index"
  resources :tweets, only: :create
  resources :usernames, only: [:new, :update]
end
