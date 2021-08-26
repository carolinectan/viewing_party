Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  get '/registration', to: 'users#new', as: :users
  post '/registration', to: 'users#create'

  get '/dashboard', to: 'dashboard#index'
  
  get '/discover', to: 'discover#index'
end
