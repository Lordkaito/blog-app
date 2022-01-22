class LikesController < ApplicationController
  # def create
  #   @post = Post.find(params[:post_id])
  #   @like = current_user.likes.new(post_id: @post.id)

  #   respond_to do |format|
  #     if @like.save
  #       format.html { redirect_to @post }
  #     else
  #       format.html { redirect_to @post }
  #     end
  #   end
  # end
  def create
    @post = Post.find(params[:post_id])
    new_like = current_user.likes.new(user_id: current_user.id, post_id: @post.id)
    respond_to do |format|
      if new_like.save
        format.html { redirect_to user_posts_path(current_user.id) }
      else
        format.html { redirect_to @post }
      end
    end
  end
end
