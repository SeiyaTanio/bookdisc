class LikesController < ApplicationController

  def create
    current_user.like_this(clicked_tweet)
    flash[:success] = '投稿にいいねしました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.likes.find_by(tweet_id: params[:tweet_id]).destroy
    flash[:danger] = '「いいね！」を解除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def clicked_tweet
    Tweet.find(params[:tweet_id])
  end
end
