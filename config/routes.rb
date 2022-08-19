Rails.application.routes.draw do
  resources :users
  resources 'articles'
  root 'articles#home'
  get '/home', to:'articles#home'
  get '/show/:id', to: 'articles#show'
  get '/about', to:'articles#about'
  
end
