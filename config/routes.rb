Rails.application.routes.draw do
  resources :streams
  resources :messages
  resources :users
  post 'favorites/create', to: 'favorites#create'
  root to: 'application#home'
  get 'logs/:name', to: 'logs#show'
  get 'logs', to: 'logs#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'signout', to: 'session#destroy'
  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  post 'stream_search', to: 'streams#find'
  get ':provider/:name', to: 'streams#show'
end
