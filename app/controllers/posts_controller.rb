class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = Post.find_by_sql("SELECT * FROM posts WHERE user_id = #{params[:id]} limit 5")
  end

  def show
    @posts = Post.find_by_sql("SELECT * FROM posts WHERE user_id = #{params[:id]}")
  end
end
