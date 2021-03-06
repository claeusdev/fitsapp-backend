Rails.application.routes.draw do
  get 'users/show'

  resources :messages do
  	collection do
  		get :inbox
  		get :sent
  	end
  end
  devise_for :trainers
  devise_for :users
  resources :users, :only => [:show]
  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
