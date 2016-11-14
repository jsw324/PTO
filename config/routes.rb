Rails.application.routes.draw do
  get 'days/index'

  devise_for :users
  resources :days
  get 'home/index'
  root 'home#index'
  get 'days/show'


  post 'days/new'
end
