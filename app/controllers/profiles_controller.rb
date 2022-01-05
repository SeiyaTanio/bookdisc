class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

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

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.image ||= @profile.image.blob
    if @profile.update(profile_update_params)
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  private

  def profile_params
    params.permit(:favorite_book, :self_introduction, :image).merge(user_id: current_user.id)
  end

  def profile_update_params
    params.require(:profile).permit(:favorite_book, :self_introduction, :image).merge(user_id: current_user.id)
  end
end
