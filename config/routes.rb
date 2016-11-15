Rails.application.routes.draw do
  get 'days/index'

  devise_for :users
  resources :days do
    get :admin, on: :collection
  end
  get 'home/index'
  root 'home#index'
  get 'days/show'
  get 'days/admin', to: 'days#admin', as: :admin


  post 'days/new'
end
