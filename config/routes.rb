Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :parties, only: [:new, :create]
  # get '/parties', to: 'parties#new'
  # post '/parties', to: 'parties#create'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  get '/registration', to: 'users#new', as: :users
  post '/registration', to: 'users#create'

  get '/dashboard', to: 'dashboard#index'
  get '/discover', to: 'discover#index'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show', as: :movie
end
