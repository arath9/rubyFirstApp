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
    @comment.save
    CommentMailer.comment_email(@post.user,@comment,current_user).deliver
    redirect_to post_path(@post)
end

def edit
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
end

 def update
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  if @comment.update(comment_params)
    redirect_to post_path(@post)
  else
    render 'edit'
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
