Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  
  get '/users/new', to: 'users#new', as: 'new_user'
  root 'static#home'
  get '/users', to:'users#index', as: 'users'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  get '/signin', to: 'session#new', as: 'signin'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]



end
