class FavoritesController < ApplicationController
  before_action :ensure_that_signed_in

  def create
    if current_user.twitch
      asdf = HTTParty.put('https://api.twitch.tv/kraken/users/'+current_user.twitchname+'/follows/channels/'+params[:channel]+'?oauth_token='+current_user.twitch)
    end
    @favorite = Favorite.new(user: current_user, stream: Stream.find_by(name:params[:channel], provider:params[:service]))
    if @favorite.save
      redirect_to '/'+params[:service]+'/'+params[:channel]
    else
    end
  end

  def destroy
    if current_user.twitch
      HTTParty.delete('https://api.twitch.tv/kraken/users/'+current_user.twitchname+'/follows/channels/'+params[:channel]+'?oauth_token='+current_user.twitch)
    end
    Favorite.find_by(user_id:current_user.id, stream_id:Stream.find_by(name:params[:channel]).id).destroy
    redirect_to '/'+params[:service]+'/'+params[:channel]
  end
end
