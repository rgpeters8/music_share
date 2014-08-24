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
  resources :comments, only: [:create, :destroy]
  
  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/home/filter', to: 'static_pages#home_filtered', via: 'get'
  match '/youtube/search',  to: 'youtube#search',  via: 'get'
  match '/youtube/post',    to: 'youtube#post', via: 'get'
  match '/posts/like', to: 'posts#like', via: 'post'
  match '/posts/unlike', to: 'posts#unlike', via: 'post'
  match '/posts/increment_play_count', to: 'posts#increment_play_count', via: 'post'
  match '/mobile',  to: 'static_pages#mobile' , via: 'get' 

  # FB Login
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  
end
