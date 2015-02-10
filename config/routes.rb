Rails.application.routes.draw do

  get 'users/index'

	root to: "ifs#main", as: 'main'

  resources :users
  resources :posts
  resources :tags
  resources :comments

  get 'search' => 'ifs#search'

end
