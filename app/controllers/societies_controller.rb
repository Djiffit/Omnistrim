class SocietiesController < ApplicationController
  before_action :set_society, only: [:show, :edit, :update, :destroy]

  # GET /societies
  def index
    @societies = Society.all
  end

  # GET /societies/1
  def show
    @users = @society.users
    @messages = @society.messages
    @chat = Message.last(20)
  end

  # GET /societies/new
  def new
    @society = Society.new
  end

  # GET /societies/1/edit
  def edit
  end

  # POST /societies
  def create
    @society = Society.new(society_params)

    if @society.save
      redirect_to @society, notice: 'Society was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /societies/1
  def update
    if @society.update(society_params)
      redirect_to @society, notice: 'Society was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /societies/1
  def destroy
    @society.destroy
    redirect_to societies_url, notice: 'Society was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society
      @society = Society.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def society_params
      params.require(:society).permit(:name, :abbreviation, :description)
    end
end
