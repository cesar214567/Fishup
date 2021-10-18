class PostsController < ApplicationController
  before_action :new_post, only: %i[new create]
  def new
    @spot = Spot.find(params[:spot_id])
    authorize @post
  end

  def create
    @post.update(post_params)
    catch = Catch.find(params[:post][:catch])
    spot = Spot.find(params[:spot_id])
    @post.user = current_user
    @post.catch = catch
    @post.spot = spot
    authorize spot
    if @post.save
      redirect_to spot_path(spot)
    else
      render :new
    end
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
    params.require(:post).permit(:title, :body, :image, :created_at)
  end
end
