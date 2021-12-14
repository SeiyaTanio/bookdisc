class ProfilesController < ApplicationController

  def index
    if Profile.none?
      render :new
    else
      @profile = Profile.find_by(user_id: current_user.id)
    end
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
  end

  private
    def profile_params
      params.permit(:favorite_book, :self_introduction, :image).merge(user_id: current_user.id)
    end
end
