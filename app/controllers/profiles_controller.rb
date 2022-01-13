class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    set_profile
  end

  def update
    set_profile
    @profile.image ||= @profile.image.blob
    if @profile.update(profile_params)
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:favorite_book, :self_introduction, :image).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find_by(user_id: params[:id])
  end
end
