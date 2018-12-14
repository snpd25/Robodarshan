Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/show'
	root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/team', to: 'static_pages#team'
  get '/workshops', to: 'static_pages#workshops'
  get '/gallery', to: 'static_pages#gallery'
  get '/projects', to: 'static_pages#projects'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :projects, only: [:create, :destroy, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
