Rails.application.routes.draw do

  root 'static_pages#home'
  resources :users
  resources :events

  get '/signup', to: 'user#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
