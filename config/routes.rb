Rails.application.routes.draw do
  get 'days/index'

  devise_for :users
  resources :days
  get 'home/index'
  root 'home#index'

  post 'days/new'
end
