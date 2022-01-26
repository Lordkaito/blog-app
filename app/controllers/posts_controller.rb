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

    @post.comments_counter = 0 if @post.comments_counter.nil?
    @post.likes_counter = 0 if @post.likes_counter.nil?

    respond_to do |format|
      format.html do
        if @post.save
          flash[:notice] = 'Post was successfully created.'
          redirect_to user_post_path(@post.user.id, @post.id)
        else
          flash[:notice] = 'Post was not created.'
          render :new
        end
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.show_all_comments_from_user
  end


  def destroy
    @user = current_user
    @post = @user.posts.find(params[:id])
    @post.comments.destroy_all
    @post.likes.destroy_all
    @post.destroy
    redirect_to user_posts_path(@user.id) , notice: 'Post successfully deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
