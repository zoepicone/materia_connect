Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dashboard#index'

  resources :mods

  get '/login', to: 'sessions#new', as: :login
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: [:get, :post]
  get '/logout', :to => 'sessions#destroy', :as => :logout

end
