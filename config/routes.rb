Rails.application.routes.draw do
  root 'static_pages#home'

  get   'login'   => 'sessions#new'
  post  'login'   => 'sessions#create'
  get   'signup'  => 'users#new'
  get   'logout'  => 'sessions#destroy'
  resources :users
end
