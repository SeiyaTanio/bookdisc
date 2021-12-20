class MessagesController < ApplicationController

  def index
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render :index
  end
end
