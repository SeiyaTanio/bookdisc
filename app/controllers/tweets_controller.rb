class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new
    @tweet.save
  end
end
