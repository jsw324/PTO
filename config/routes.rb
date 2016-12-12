Rails.application.routes.draw do
  get 'days/index'

  devise_for :users
  resources :days do
    get :admin, on: :collection
    get :adminShow, on: :collection
  end

resources :days
  get 'home/index'
  root 'home#index'
  get 'days/show'
  get 'days/admin', to: 'days#admin', as: :admin
  put 'days/:id', to: 'days#update'
  patch 'days/:id', to: 'days#update'


  post 'days/new'
end
