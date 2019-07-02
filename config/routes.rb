Rails.application.routes.draw do
  root 'static#home'
  resources :sessions, only: :create
  resources :registrations, only: :create
  get :loged_in, to: "sessions#logged_in"
  get :logout, to: "sessions#logout"

end
