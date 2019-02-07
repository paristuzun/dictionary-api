Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'

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
  resources :categories, only: [:create, :show, :index]
end
