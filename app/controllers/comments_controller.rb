class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.user = current_user_
    @comment.save
    respond_to do |format|
      format.html { redirect_to user_post_path(@post.user.id, @post.id) }
    end
  end
end
