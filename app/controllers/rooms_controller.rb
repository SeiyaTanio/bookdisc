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
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @host_id = @room.user_rooms[0].user_id
  end

  private
  def room_params
    params.require(:room).permit(:room_name, user_ids: [])
  end

end
