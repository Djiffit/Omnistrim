class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.find_by(name:params[:username])
      session[:name] = params[:username]
    end
    redirect_to root_path
  end
end
