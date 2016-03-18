class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    @streams = (HTTParty.get 'https://api.twitch.tv/kraken/streams?limit=200')['streams']
    @messages = Message.last(20)
    render 'layouts/home'
  end
end
