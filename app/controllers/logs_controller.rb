class LogsController < ApplicationController
  def index
    @users = User.all.includes(:messages)
  end

  def show
    if params[:name] == 'all'
      @messages = Message.all
    else
      @user = User.find_by(name:params[:name])
      @messages = Message.all.where(user:@user)
    end
  end
end
