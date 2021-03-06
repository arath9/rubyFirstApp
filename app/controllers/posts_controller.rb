class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy  
    redirect_to posts_path
  end

  def create
    @post = Post.new(post_params)
    @post.date = Date.new
    @post.user = current_user
      if @post.save
        @user = @post.user
        redirect_to @post
      else
        render 'new'
      end
    end

  def send_report
    UserMailer.user_report(current_user).deliver!
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content,:category_id)
  end
end
