class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    return nil if session[:user].nil?
    User.find(session[:user])
  end

  def home
    @streams = getStreams
    @messages = Message.where(society_id:nil, target_name:nil).last(20)
    if current_user && current_user.youtubetoken
      account = Yt::Account.new refresh_token: current_user.youtubetoken
      @youtube = account.subscribed_channels
    end

    if current_user && current_user.twitch
      @follows = (HTTParty.get ('https://api.twitch.tv/kraken/streams/followed/?oauth_token='+current_user.twitch))["streams"]
    end
    render 'layouts/home'
  end

  def getStreams
    (HTTParty.get 'https://api.twitch.tv/kraken/streams?limit=200')['streams']
  end

  def ensure_that_signed_in
    redirect_to signin_path, notice:'you should be signed in' if current_user.nil?
  end
end
