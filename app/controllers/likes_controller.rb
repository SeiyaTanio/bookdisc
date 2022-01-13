class LikesController < ApplicationController

  def create
    resource, id = request.path.split('/')[1, 2]
    @likeable = resource.singularize.classify.constantize.find(id)
    current_user.like(@likeable)
    render formats: :js, layout: false
  end

  def destroy
    @tweet = Like.find(params[:id]).tweet
    current_user.unlike(@tweet)
    render formats: :js, layout: false
  end

end
