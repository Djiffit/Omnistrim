class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render 'streams/show'
  end

  def create
    @message = Message.create(content: params[:message][:content])
    PrivatePub.publish_to("/messages/new", message: @message)
    @message.user_id = current_user.id
    @message.save
  end
end
