Rails.application.routes.draw do
  resources :streams
  resources :messages
  resources :users
  root to: 'rooms#show'
  get 'logs/:name', to: 'logs#show'
  get 'logs', to: 'logs#index'
  get 'signup', to: 'users#new'
  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  post 'stream_search', to: 'streams#find'
  get ':provider/:name', to: 'streams#show'
end
