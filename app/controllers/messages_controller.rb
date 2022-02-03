class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.find(params[:room_id])
    @message = Message.new
    @messages = @room.messages.includes(:user)
    @host_id = @room.user_rooms[0].user_id
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @messages = @room.messages.includes(:user)
    if @message.save
      render formats: :js, layout: false
    else
      @host_id = @room.user_rooms[0].user_id
      render :index
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    room = Room.find(params[:room_id])
    @messages = room.messages.includes(:user)
    render formats: :js, layout: false
    ## redirect_to room_messages_path(params[:room_id])
  end

  private

  def message_params
    params.require(:message).permit(:sentence).merge(user_id: current_user.id)
  end
end
