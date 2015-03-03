Rails.application.routes.draw do
  
  root 'teams#index'
  get 'about' => 'teams#about'
  get 'scheme' => 'teams#scheme'
  resources :teams, except: [:destroy, :edit, :update, :create, :new]
  # match 'auth/twitter/callback', to: 'sessions#create', via: 'get'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', :to => 'sessions#destroy'

  


end
