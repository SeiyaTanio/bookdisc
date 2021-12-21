class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @tweets = Tweet.includes(:user).order('updated_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    set_tweet
    @t_comments = @tweet.t_comments.includes(:user).order('updated_at DESC')
  end

  def edit
    set_tweet
  end

  def update
    set_tweet
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    set_tweet
    @tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
