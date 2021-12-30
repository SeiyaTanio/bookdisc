class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_messages_path(@room.id)
    else
      render :new
    end
  end

  def show
    @rooms = current_user.rooms.all.order('updated_at DESC')
  end

  def edit
    set_room
  end

  def update
    set_room
    if @room.update(room_params)
      redirect_to room_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    set_room
    @room.destroy
    redirect_to room_path(current_user.id)
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_image, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
