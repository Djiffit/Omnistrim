class LogsController < ApplicationController
  def index
    @users = User.all.includes(:messages)
    @societies = Society.all.includes(:messages)
  end

  def show
    if params[:name] == 'all'
      @messages = Message.all.select { |a| a.society.nil? && (a.target_name != current_user.name ) }
    else
      if params[:name].length == 3
        @society = Society.find_by_abbreviation(params[:name])
        if !current_user.societies.include?(@society)
          redirect_to('/logs', notice: "You cannot view the logs of a society that you are not a part of!")
        end
        @messages = Message.all.where(society: @society)
      end
      if params[:name].length > 3
        @user = User.find_by(name: params[:name])
        @messages = Message.all.where(user: @user)
        @messages = @messages.select { |a| a.society.nil? && a.target_name.nil? }
      end
    end
  end
end
