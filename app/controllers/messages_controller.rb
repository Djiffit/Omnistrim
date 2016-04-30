class MessagesController < ApplicationController
  before_action :ensure_that_signed_in, except: [:index]

  def index
    @messages = Message.all
    render 'streams/show'
  end

  def create
    @message = Message.create(content: params[:message][:content])
    if @message.content.to_s.length > 0
      @message.user_id = current_user.id
      if @message.content[0..4].match('^/[a-z][a-z][a-z][ ]')
        @message.society_id = Society.find_by_abbreviation(@message.content.to_s[1..3]).id
        if current_user.societies.include?(@message.society)
          @message.content = @message.content.slice(4..@message.content.length-1)
          PrivatePub.publish_to("/messages/"+@message.society.abbreviation, message: @message)
          @message.save
        end
      else
        if @message.content[0..4].match('^/[w][ ]')
          @message.target_name = @message.content.split[1]
          @message.content = @message.content.slice(3+@message.content.split[1].length..@message.content.length-1)
          PrivatePub.publish_to("/messages/"+@message.target_name, message: @message)
          @message.save
        else
          PrivatePub.publish_to("/messages/public", message: @message)
          @message.save
        end
      end
    end
  end

end
