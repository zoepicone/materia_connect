Rails.application.routes.draw do

  # Defines the root path route ("/")
  root 'dashboard#index'

  resources :mods
  resources :users, only: %i[show edit update destroy]

  get 'mods/tag/:tag', to: 'mods#with_tag', as: :mod_tag
  get 'search/', to: 'mods#search', as: :search

  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
  match 'auth/:provider/callback', to: 'sessions#create', via: %i[get post]
  match '/auth/failure', to: 'sessions#failure', via: %i[get post]

  # Health check endpoint
  get '/up', to: proc { [200, {}, []] }
end
