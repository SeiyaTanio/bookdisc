class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :mine]

  def index
    @tweets = Tweet.includes(:user).order('updated_at DESC')
  end

  def new
    @user = User.find(current_user.id)
    @tweet_form = TweetForm.new
  end

  def create
    @user = User.find(current_user.id)
    @tweet_form = TweetForm.new(tweet_form_params)
    if @tweet_form.valid?
      @tweet_form.save
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
    @user = @tweet.user
    tweet_attributes = @tweet.attributes
    @tweet_form = TweetForm.new(tweet_attributes)
    @tweet_form.t_tag_name = @tweet.t_tags&.first&.t_tag_name
  end

  def update
    set_tweet
    @user = @tweet.user
    @tweet_form = TweetForm.new(tweet_form_params)
    if @tweet_form.valid?
      @tweet_form.update(tweet_form_params, @tweet)
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

  def search
    return nil if params[:keyword] == ""
    t_tag = TTag.where(['t_tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: t_tag }
  end

  def mine
    tweets = Tweet.includes(:user).order('updated_at DESC')
    @tweets = tweets.where(user_id: params[:id])
  end

  private

  def tweet_form_params
    params.require(:tweet_form).permit(:content, :t_tag_name, {tweet_images: []}).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
