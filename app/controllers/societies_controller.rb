class SocietiesController < ApplicationController
  before_action :set_society, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, only: [:new, :create, :destroy, :edit]

  # GET /societies
  def index
    @societies = Society.all
  end

  # GET /societies/1
  def show
    @membership = Membership.new
    @users = @society.users
    @messages = @society.messages
    @chat = Message.where(society_id: nil, target_name: nil).last(20)
  end

  # GET /societies/new
  def new
    @society = Society.new
    @streams = Stream.where('provider=? OR provider=?', 'twitch', 'ustream')
  end

  # POST /societies
  def create
    if params[:stream_id]
      @society = Society.new(name: params[:nameS], abbreviation: params[:abbreviation], description: params[:description], stream_id: params[:stream_id])
    else
      @society = Society.new(name: params[:nameS], abbreviation: params[:abbreviation], description: params[:description])
    end
    @society.user_id = current_user.id

    if @society.save
      membership = Membership.create(user_id: current_user.id, society_id: @society.id)
      redirect_to @society, notice: 'Society was successfully created.'
    else
      redirect_to('/societies/new', notice: 'Creation failed! Try again')
    end
  end




  private
  # Use callbacks to share common setup or constraints between actions.
  def set_society
    @society = Society.find(params[:id])
  end

end
