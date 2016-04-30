class SessionController < ApplicationController
  before_action :ensure_that_signed_in, except: [:new, :create]

  def new
    @user = User.new
  end

  def create_auth_yt
    account = Yt::Account.new authorization_code: params['code'], redirect_uri: 'http://omnistrim.herokuapp.com/ytauth'
    current_user.update_attribute(:youtubetoken, account.refresh_token)
    redirect_to '/'
  end

  def create_auth_twitch
    response = HTTParty.post('https://api.twitch.tv/kraken/oauth2/token?client_id=ht0ychka5fc2g0ao527ick5mjcvmob0&client_secret=s4racyuaz2kt0hn66jrfu5bamnut9ci&grant_type=authorization_code&code='+params[:code]+'&redirect_uri=http://omnistrim.herokuapp.com/twitchauth/')
    #response = HTTParty.post('https://api.twitch.tv/kraken/oauth2/token?client_id=ht0ychka5fc2g0ao527ick5mjcvmob0&client_secret=s4racyuaz2kt0hn66jrfu5bamnut9ci&grant_type=authorization_code&code='+params[:code]+'&redirect_uri=http://localhost:3000/twitchauth/')
    current_user.update_attribute(:twitch, response["access_token"])
    namerequest = HTTParty.get('https://api.twitch.tv/kraken/user?oauth_token='+response["access_token"])
    current_user.update_attribute(:twitchname, namerequest["display_name"])
    if current_user.twitch
      streams = HTTParty.get('https://api.twitch.tv/kraken/users/'+current_user.twitchname+'/follows/channels?sortby=last_broadcast&limit=200')
      list = streams["follows"]
      list.map do |s|
        stream = Stream.find_by(name:s["channel"]["name"], provider:'twitch')
        if stream.nil?
          stream = Stream.create(name:s["channel"]['name'], provider:'twitch')
          stream.icon = s['channel']['logo']
          stream.save
        end
        if Favorite.find_by(stream_id:stream.id, user_id:current_user.id).nil?
          favorite = Favorite.create(stream:stream, user:current_user)
        end
      end
    end
    redirect_to user_path(current_user)
  end

  def create
    @user = User.find_by(name:params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to :back, notice: "Username and password do not match!"
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_path, notice: "Successfully logged out!"
  end
end
