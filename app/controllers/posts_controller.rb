class PostsController < ApplicationController
  before_action :new_post, only: %i[new create]
  def new
    @spot = Spot.find(params[:spot_id])
    authorize @post
  end

  def create
  end

  private
  def new_post
    @post = Post.new
  end

  def set_post
    @post = Post.find(params[:id])
    @post.user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
