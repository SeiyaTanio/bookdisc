class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
  end

  private 
  
  def tweet_params
    params.require(:tweet).permit(:content).merge(user_id: current_user.id)
  end
end
