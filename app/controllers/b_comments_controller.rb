class BCommentsController < ApplicationController

  def new
  end

  def create
    @b_comment = BComment.new(b_comment_params)
    if @b_comment.save
      redirect_to blog_path(@b_comment.blog_id)
    else
      render :new
    end
  end

  private
  def b_comment_params
    params.require(:b_comment).permit(:b_text).merge(user_id: current_user.id, blog_id: params[:blog_id])
  end
end
