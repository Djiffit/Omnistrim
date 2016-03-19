class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(name: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
