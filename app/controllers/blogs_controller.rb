class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :mine]

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
    @b_comment = BComment.new
    @b_comments = @blog.b_comments.includes(:user).order('updated_at DESC')
  end

  def edit
    set_blog
  end

  def update
    set_blog
    if @blog.update(blog_params)
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
    @blogs = blogs.where(user_id: params[:id])
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :article, :blog_image).merge(user_id: current_user.id)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
