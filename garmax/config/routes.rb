Rails.application.routes.draw do

  get 'articles/new'
  get 'articles/show'
  get 'articles/index'
  get 'articles/delete'
  get 'articles/edit'
  root 'articles#index'

  get 'sessions/new'
  get 'users/new'

  resources :users
  resources :articles

  post 'articles/show', to: 'articles#add_comment'
  post 'article/rate', to: 'articles#rate'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
