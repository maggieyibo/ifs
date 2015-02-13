Rails.application.routes.draw do

  root to: "ifs#main", as: 'main'

  resources :users
  resources :posts
  resources :tags
  resources :comments

  get 'search' => 'ifs#search'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
