class StreamsController < ApplicationController
  before_action :set_stream, only: [:show, :edit, :update, :destroy]


  def twitch
    @provider = 'twitch'
    @messages = Message.last(20)
    render 'show'
  end

  def index
    @streams = Stream.all
  end

  def create
    @stream = Stream.new(stream_params)

    respond_to do |format|
      if @stream.save
        format.html { redirect_to @stream, notice: 'Stream was successfully created.' }
        format.json { render :show, status: :created, location: @stream }
      else
        format.html { render :new }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stream
      @stream = Stream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stream_params
      params.require(:stream).permit(:name, :provider)
    end
end
