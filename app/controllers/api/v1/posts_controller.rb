class Api::V1::PostsController < Api::V1::ApiController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      render json: { status: 201, message: 'Comment created successfully!' }
    else
      render json: { errors: @post.errors }, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
