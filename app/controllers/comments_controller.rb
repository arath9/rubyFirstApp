class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      puts "entre"
      redirect_to post_path(@post)
    else
      puts "no entre"
    end
end

def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
end

private
def comment_params
  params.require(:comment).permit(:text)
end

end
