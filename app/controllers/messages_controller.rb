class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render 'streams/show'
  end

  def create
    @message = Message.create(content: params[:message][:content])
    PrivatePub.publish_to("/messages/new", message: @message)
  end
end
