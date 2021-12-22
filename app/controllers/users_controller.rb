class UsersController < ApplicationController

  def show
    if Profile.find_by(user_id: params[:id]).nil?
      render :new
    else
      user = User.find(params[:id])
      @profile = user.profile
      @tweets = user.tweets.order('updated_at DESC')
      @image = @profile.image
      @image = 'bookdisc-icon-image.png' unless @image.present?
    end
  end
end
