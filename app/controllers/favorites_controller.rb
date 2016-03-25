class FavoritesController < ApplicationController

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
end
