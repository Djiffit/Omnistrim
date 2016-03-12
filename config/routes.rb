Rails.application.routes.draw do
  resources :streams
  resources :users
  root to: 'rooms#show'
  get 'logs/:name', to: 'logs#show'
  get 'logs', to: 'logs#index'
  get 'signup', to: 'users#new'
  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  get 'stream_search', to: 'streams#search'
  get 'twitch/:name' => 'streams#twitch'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
