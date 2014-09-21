PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :posts, except: [:destroy] do
  	resources :comments, only: [:create]
  	member do 
  		post 'vote'
  	end
  end


  resources :comments do
  	member do
  		post 'vote'
  	end
  end

  resources :categories
  resources :users, only: [:show, :create, :edit, :update]


end
