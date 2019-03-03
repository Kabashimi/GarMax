Rails.application.routes.draw do

  root 'sessions#new'

  get 'sessions/new'
  get 'users/new'

  resources :users
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
