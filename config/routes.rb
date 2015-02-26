Rails.application.routes.draw do
  
  root 'teams#index'
  get 'about' => 'teams#about'
  get 'scheme' => 'teams#scheme'
  resources :teams, except: [:destroy, :edit, :update, :create, :new]

end
