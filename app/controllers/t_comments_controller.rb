class TCommentsController < ApplicationController

  def new
    @t_comment = TComment.new
  end

  def create
    @t_comment = TComment.new(t_comment_params)
    if @t_comment.save
    redirect_to tweet_path(t_comment.tweet_id)
    else
      render :new
    end
  end

  private
  def t_comment_params
    params.require(:t_comment).permit(:t_text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

end
