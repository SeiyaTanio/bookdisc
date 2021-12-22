class LikesController < ApplicationController

  def create
    if current_user.like_this(clicked_tweet)
      flash[:success] = '投稿にいいねしました'
      redirect_back(fallback_location: root_path)
    else
      flash[:alart] = 'いいねに失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def clicked_tweet
    Tweet.find(params[:tweet_id])
  end
end
