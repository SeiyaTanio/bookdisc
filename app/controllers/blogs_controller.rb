class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @blogs = Blog.includes(:user).order('updated_at DESC')
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def show
    set_blog
    @b_comments = @blog.b_comments.includes(:user).order('updated_at DESC')
  end

  def edit
    set_blog
  end

  def update
    set_blog
    if @blog.update(blog_update_params)
      redirect_to blog_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    set_blog
    @blog.destroy
    redirect_to action: :index
  end

  def mine
    blogs = Blog.includes(:user).order('updated_at DESC')
    if blogs.find_by(user_id: params[:id]).present?
      @blogs = blogs.where(user_id: params[:id])
    else
      render :new
    end
  end

  private
  def blog_params
    params.permit(:title, :article).merge(user_id: current_user.id)
  end

  def blog_update_params
    params.require(:blog).permit(:title, :article).merge(user_id: current_user.id)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
