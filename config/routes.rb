Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/users/sign_in'
  post '/users/login'
  get '/users/logout'
  get '/products/index', to: 'products#index'
  get '/products/:id', to: 'products#show', as: 'product'

  resources :users, only: [:new, :create, :edit, :update, :show]
  get '/', to: 'home#top'
  # Defines the root path route ("/")
  # root "articles#index"
end
