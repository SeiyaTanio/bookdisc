class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order('updated_at DESC')
    @blogs = @user.blogs.order('updated_at DESC')
    @likes = @user.likes.where(likeable_type: 'tweet').order('updated_at DESC')
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  def search
    if params[:q]&.dig(:nickname)
      squished_keywords = params[:q][:nickname].squish
      params[:q][:nickname_cont_any] = squished_keywords.split(" ")
    end
    @q = User.ransack(params[:q])
    @users = @q.result
  end
end
