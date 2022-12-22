Rails.application.routes.draw do
  get 'user/show'
  get 'user/edit'
  get 'user/update'
  get 'user/destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dashboard#index'

  resources :mods
  resources :users, only: %i[show edit update destroy]

  get 'mods/tag/:tag', to: 'mods#with_tag', as: :mod_tag
  get 'search/', to: 'mods#search', as: :search

  get '/login', to: 'sessions#new', as: :login
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: [:get, :post]
  get '/logout', to: 'sessions#destroy', as: :logout

end
