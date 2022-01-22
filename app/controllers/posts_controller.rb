class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts_from_user
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_post_path(@post.user.id, @post.id)
        else
          render :new
        end
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.show_all_comments_from_user
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
