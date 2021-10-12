class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @spot_images = @spot.images.all
    @posts = Post.new
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @user = current_user
    @spot.user = @user
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:longitude, :latitude, :name, :description, images: [])
  end
end
