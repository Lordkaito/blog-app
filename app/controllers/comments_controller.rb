class CommentsController < ApplicationController
  # load_and_authorize_resource
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:notice] = 'Comment was successfully created.'
          redirect_to user_post_path(@comment.post.user.id, @comment.post.id)
        else
          flash[:notice] = 'Comment was not created.'
          render :new
        end
      end
    end
  end

  def destroy
    @post = Post.includes(:comments).find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    @post.comments_counter -= 1
    @post.save
    redirect_to("/users/#{current_user.id}/posts/#{@post.id}")
    flash[:success] = 'Comment was deleted!'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
