Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'topics#index'
  get 'register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/about', to: 'pages#about'

  resources :topics, except: [:destroy] do
    member do
      post :vote
    end
    resources :entries, only: [:create] do
      member do
        post :vote
      end
    end
  end
  resources :users, except: [:destroy]
  resources :categories, only: [:new, :create, :show]
end
