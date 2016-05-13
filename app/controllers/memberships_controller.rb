class MembershipsController < ApplicationController
  before_action :ensure_that_signed_in
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # POST /memberships
  def create
    @membership = Membership.create(user_id:params[:user_id], society_id:params[:society_id])
    if @membership.save
      redirect_to society_path(params[:society_id]), notice: 'Membership was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a trusted parameter "white list" through.
    def membership_params
      params.require(:membership).permit(:user_id, :society_id)
    end
end
