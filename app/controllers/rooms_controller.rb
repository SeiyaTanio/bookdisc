class RoomsController < ApplicationController

  def index
    if UserRoom.find_by(user_id: current_user.id).nil?
      render :new
    else
      @rooms = current_user.rooms.all.order('updated_at DESC')
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    set_room
    @host_id = @room.user_rooms[0].user_id
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
    redirect_to rooms_path
  end

  private
  def room_params
    params.require(:room).permit(:room_name, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
