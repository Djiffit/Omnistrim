class LogsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:name] == 'all'
      @messages = Message.all
    else
      @user = User.find_by(name:params[:name])
      @messages = Message.all.where(name:params[:name])
    end
  end
end
