class SessionController < ApplicationController

  def new
    @user = User.new
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
