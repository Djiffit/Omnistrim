class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render 'streams/show'
  end

  def create
    @message = Message.create(content: params[:message][:content])
    @message.user_id = current_user.id
    if @message.content.match('^/[a-z][a-z][a-z][ ]')
      @message.society_id = Society.find_by_abbreviation(@message.content.to_s[1..3]).id
      @message.content = @message.content.slice(4..@message.content.length-1)
      PrivatePub.publish_to("/messages/"+@message.society.abbreviation, message: @message)
      @message.save
    else
      @message.society_id = Society.find_by_abbreviation('dum').id
      PrivatePub.publish_to("/messages/public", message: @message)
      @message.save
    end
  end
end
