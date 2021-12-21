class TCommentsController < ApplicationController

  def create
    t_comment = TComment.create(t_comment_params)
    redirect_to tweet_path(t_comment.tweet_id)
  end

  private
  def t_comment_params
    params.require(:t_comment).permit(:t_text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

end
