class MessagesController < ApplicationController
  before_action except: [:index]

  def create
    @message = Message.create(content: params[:message][:content])
    if @message.content.to_s.length > 0
      if current_user
        @message.user_id = current_user.id
      else
        @message.user_id = 1
      end
      findMessageType
    end
    if !current_user
      redirect_to '/'
    end
  end

  def findMessageType
    if @message.content[0..4].match('^/[a-z][a-z][a-z][ ]') && !Society.find_by_abbreviation(@message.content.to_s[1..3]).nil? && current_user.societies.include?(Society.find_by_abbreviation(@message.content.to_s[1..3]))
      createSocietyMessage
    else
      if @message.content[0..4].match('^/[w][ ]') && !User.find_by_name(@message.content.split[1].capitalize).nil?
        createPrivateMessage
      else
        PrivatePub.publish_to("/messages/public", message: @message)
        @message.save
      end
    end
  end

  def createPrivateMessage
    @message.target_name = @message.content.split[1].capitalize
    @message.content = @message.content.slice(3+@message.content.split[1].capitalize.length..@message.content.length-1)
    PrivatePub.publish_to("/messages/"+@message.target_name, message: @message)
    @message.save
  end

  def createSocietyMessage
    @message.society_id = Society.find_by_abbreviation(@message.content.to_s[1..3]).id
    if current_user.societies.include?(@message.society)
      @message.content = @message.content.slice(4..@message.content.length-1)
      PrivatePub.publish_to("/messages/"+@message.society.abbreviation, message: @message)
      @message.save
    end
  end

end
