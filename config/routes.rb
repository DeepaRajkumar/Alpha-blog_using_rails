Rails.application.routes.draw do
  
  resources 'articles' 
  root 'articles#home'
  get '/home', to:'articles#home'
  get '/show/:id', to: 'articles#show'
  get '/about', to:'articles#about'
  get '/delete/:id', to:'articles#destroy'
  get '/search', to: "articles#search"
  resources 'customers'
  get '/signup', to:'customers#new'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to:'sessions#destroy'
  resources 'categories'
  resources 'articles' do
  resources 'comments'
  post '/add', to:'comments#create'
  end 
  
end
