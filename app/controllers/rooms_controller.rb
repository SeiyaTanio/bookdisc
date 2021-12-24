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
    if UserRoom.find_by(user_id: current_user.id).nil?
      render :index
    else
      @rooms = current_user.rooms.all.order('updated_at DESC')
    end
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
    params.require(:room).permit(:room_name, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
