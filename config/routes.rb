Rails.application.routes.draw do

  root 'posts#index'

  get       'login'   => 'sessions#new'
  post      'login'   => 'sessions#create'
  get       'signup'  => 'users#new'
  delete    'logout'  => 'sessions#destroy'
  
  resources :users
  resources :posts, only: [:show, :new, :index, :create]
end
