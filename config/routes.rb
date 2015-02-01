Rails.application.routes.draw do

	root to: "ifs#main"

  resources :users
  resources :posts do
    resources :comments
  end

  resources :tags

end
