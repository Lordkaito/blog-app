class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_like = current_user.likes.new(user_id: current_user.id, post_id: @post.id)
    respond_to do |format|
      if new_like.save
        flash[:notice] = "Post liked successfully"
        format.html { redirect_to user_posts_path(current_user.id) }
      else
        flash[:alert] = "Post not liked"
        format.html { redirect_to @post }
      end
    end
  end
end
