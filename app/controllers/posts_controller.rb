class PostsController < ApplicationController
  before_action :new_post, only: %i[new create]
  def new
  end

  def create
  end

  private
  def new_post
    @post = Post.new
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
end
