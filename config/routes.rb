Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  root to: "tasklists#index"
  resources :tasklists
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
end
