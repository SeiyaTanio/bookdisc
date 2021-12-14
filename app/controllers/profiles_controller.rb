class ProfilesController < ApplicationController

  def index
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end

  private
    def profile_params
      params.require(:profile).permit(:favorite_book, :self_introduction).merge(user_id: current_user.id)
    end
end
