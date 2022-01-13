class LikesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet])
    current_user.like(@tweet)
    render formats: :js, layout: false
  end

  def destroy
    @tweet = Like.find(params[:id]).tweet
    current_user.unlike(@tweet)
    render formats: :js, layout: false
  end

end
