Rails.application.routes.draw do
  root to: 'skills#edit'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :categories
  resources :skills,except: [:index, :show]
end
