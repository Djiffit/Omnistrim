class StreamsController < ApplicationController
  before_action :set_stream, only: [:edit, :update, :destroy]

  def show_channel
    @channel = Yt::Channel.new id: params[:id]
    @channel = @channel.videos
  end

  def show
    @provider = params[:provider]
    @messages = Message.where(society_id: nil, target_name: nil).last(20)
    if (@provider == 'ustream')
      @stream = (HTTParty.get ('http://api.embedly.com/1/oembed?url=ustream.tv/'+params[:name].downcase+'&width=1600&autoplay=true&height=900&key=:08c367084bc646d9930486f5b88d53c6'))
      if (@stream["error"])
        redirect_to root_path, notice: "Channel not found!"
        return
      end
    end
    chooseProvider
  end

  def chooseProvider
    if Stream.find_by(name: params[:name], provider: params[:provider]).nil?
      stream = Stream.create(name: params[:name], provider: params[:provider])
      if (@provider == 'twitch')
        strim = (HTTParty.get ('https://api.twitch.tv/kraken/streams/'+params[:name].downcase))
        if strim['stream'] == "null"
          stream.icon = strim['stream']['channel']['logo']
          stream.save
        else
          strim = (HTTParty.get ('https://api.twitch.tv/kraken/channels/'+params[:name].downcase))
          if strim['status'] != 404
            stream.icon = strim['logo']
          else
            redirect_to '/', notice: "Channel not found!"
          end
        end

      end
      if (@provider == 'ustream')
        stream.icon = @stream['thumbnail_url']
        stream.save
      end
      if (@provider == 'azubu')
        stream.icon = (HTTParty.get('http://api.azubu.tv/public/channel/'+params[:name].downcase))['data']['user']['profile']['url_photo_large']
        stream.save
      end
    end
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
    end
    redirect_to('/'+params[:provider]+'/'+params[:name])
  end

end
