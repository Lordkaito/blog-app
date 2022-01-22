class CommentsController < ApplicationController
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

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
