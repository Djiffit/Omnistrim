class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user: current_user, stream: Stream.find_by(name:params[:channel], provider:params[:service]))
    respond_to do |format|
      if @favorite.save
      else
      end
    end
  end

end
