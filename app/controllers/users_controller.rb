class UsersController < ApplicationController

  def show
    if Profile.find_by(user_id: params[:id]).nil?
      @user = User.find(params[:id])
      @tweets = @user.tweets.order('updated_at DESC')
    else
      @user = User.find(params[:id])
      @profile = @user.profile
      @tweets = @user.tweets.order('updated_at DESC')
      if @image.present?
        @image = @profile.image
      else
        @image = 'bookdisc-icon-image.png'
      end
    end
  end

  def search
    @q = User.ransack(params[:q])
    @users = @q.result
  end
end
