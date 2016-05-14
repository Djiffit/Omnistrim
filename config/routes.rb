Rails.application.routes.draw do
  resources :memberships
  resources :societies
  resources :streams
  resources :messages
  resources :users
  post 'favorites/destroy', to: 'favorites#destroy'
  post 'societies/create', to: 'societies#create'
  post 'societies/join', to: 'memberships#create'
  post 'favorites/create', to: 'favorites#create'
  get 'twitch/add', to: 'session#createStreamsAndFavorites'
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
  get 'twitchauth/', to: 'session#create_auth_twitch'
  get 'ytauth/', to: 'session#create_auth_yt'
  get 'channel/view/:id', to: 'streams#show_channel'
  get '/youtubeauthlink', to: 'streams#show'
end
# s4racyuaz2kt0hn66jrfu5bamnut9ci
# https://accounts.google.com/o/oauth2/auth?access_type=offline&approval_prompt=auto&client_id=527203940713-6o128c0piis6gm1t3rnk3rrmmdvq8tgr.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fytauth&response_type=code&scope=https://www.googleapis.com/auth/youtube&approval_prompt=force