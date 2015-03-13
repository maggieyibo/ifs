Rails.application.routes.draw do

  root to: "ifs#main", as: 'main'

  resources :users

  resources :posts do
    resources :comments
  end
  
  resources :tags
  

  get 'search' => 'ifs#search'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
