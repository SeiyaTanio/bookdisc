class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user)
  end
end
