class BlogsController < ApplicationController
  before_action :authenticate_user!, only: :new

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
  end

  def edit
    set_blog
  end

  def update
    set_blog
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :article).merge(user_id: current_user.id)
  end 

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
