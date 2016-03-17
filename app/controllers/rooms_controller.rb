class RoomsController < ApplicationController
  def show
    @messages = Message.last(20)
    render 'layouts/home'
  end
end
