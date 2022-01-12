class RelationshipsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @follows = Relationship.where(user_id: params[:user_id]).order('updated_at DESC')
  end

  def list
    @user = User.find(params[:user_id])
    @followers = Relationship.where(follower_id: params[:user_id]).order('updated_at DESC')
  end


  def create
    @other_user = User.find(params[:follower])
    current_user.follow(@other_user)
    render formats: :js, layout: false
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
    render formats: :js, layout: false
  end
end
