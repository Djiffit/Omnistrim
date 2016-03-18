class StreamsController < ApplicationController
  before_action :set_stream, only: [:edit, :update, :destroy]


  def show
    @provider = params[:provider]
    @messages = Message.last(20)
  end

  def find
    if (params[:provider] == 'twitch')
      params[:stream] = HTTParty.get "https://api.twitch.tv/kraken/streams/"+ERB::Util.url_encode(params[:name])
      if (params[:stream]["error"] || params[:stream][:stream].nil?)
        @search = (HTTParty.get ('https://api.twitch.tv/kraken/search/streams?limit=200&q='+ERB::Util.url_encode(params[:name]))).parsed_response["streams"]
        if (@search.count == 0)
          @top = (HTTParty.get ('https://api.twitch.tv/kraken/streams/'))['streams']
        end
        render 'streams/search'
        return
      end
      redirect_to('/'+params[:provider]+'/'+params[:name])
    end
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
