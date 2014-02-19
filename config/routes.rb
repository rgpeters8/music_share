MusicShare::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :search
  resources :posts, only: [:create, :destroy, :play,]
  resources :relationships, only: [:create, :destroy]
  
  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/youtube/search',  to: 'youtube#search',  via: 'get'
  match '/youtube/post',    to: 'youtube#post', via: 'get'
  
  mount Sinatra => "/api"
end
