class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    # @commenttt = Comment.find(params[:comment_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(@comment.post.user.id, @comment.post.id)
        else
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
