class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    return nil if session[:user].nil?
    User.find(session[:user])
  end

  def home
    @streams = (HTTParty.get 'https://api.twitch.tv/kraken/streams?limit=200')['streams']
    @messages = Message.last(20)
    render 'layouts/home'
  end
end
