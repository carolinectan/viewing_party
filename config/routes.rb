Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :parties, only: [:new, :create]
  # get '/parties', to: 'parties#new'
  # post '/parties', to: 'parties#create'

  get '/registration', to: 'users#new', as: :users
  post '/registration', to: 'users#create'

  get '/dashboard', to: 'dashboard#index'

  get '/discover', to: 'discover#index'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show', as: :movie

  post '/friendships', to: 'friendships#create'
end
