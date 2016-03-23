class FavoritesController < ApplicationController

  def create
    asdf = HTTParty.put('https://api.twitch.tv/kraken/users/'+current_user.twitchname+'/follows/channels/'+params[:channel]+'?oauth_token='+current_user.twitch)
    @favorite = Favorite.new(user: current_user, stream: Stream.find_by(name:params[:channel], provider:params[:service]))
    respond_to do |format|
      if @favorite.save
      else
      end
    end
  end

end
