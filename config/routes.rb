Rails.application.routes.draw do

	root to: "ifs#main"

  resources :users
  resources :posts

  resources :tags

end
