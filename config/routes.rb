Rails.application.routes.draw do
  get 'pto/index'

  devise_for :users
  get 'home/index'
  root 'home#index'
end
