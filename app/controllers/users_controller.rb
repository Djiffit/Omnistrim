class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(name:params[:user][:name])
    redirect_to(user_path(user))
  end
  def show
    @user = User.find(params[:id])
  end
end
