Rails.application.routes.draw do
  # Authentication routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/:user_id/:token', to: 'sessions#magic_link', as: 'magic_link'
  
  # Admin routes
  namespace :admin do
    root to: 'dashboard#index'
    
    resources :gigs
    resources :pages
    resources :series
  end
  
  # Public routes
  root to: 'pages#home'
  
  get '/gigs', to: 'gigs#index', as: 'gigs'
  get '/gigs/:id', to: 'gigs#show', as: 'gig'
  
  get '/series/:id', to: 'gigs#series', as: 'series'
  
  # Catch-all route for pages
  get '/:id', to: 'pages#show', as: 'page'
end