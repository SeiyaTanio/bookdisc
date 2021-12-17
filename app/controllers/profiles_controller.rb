class ProfilesController < ApplicationController

  def index
    if Profile.find_by(user_id: current_user.id) == nil
      render :new
    else
      @profile = Profile.find_by(user_id: current_user.id)
      @tweets = Tweet.where(user_id: current_user.id).order('updated_at DESC')
      @image = @profile.image
      unless @image.present?
        @image = "bookdisc-icon-image.png"
      end
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

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_update_params)
      redirect_to action: :index
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
