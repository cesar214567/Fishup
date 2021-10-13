class SpotsController < ApplicationController
  def index
    @spots = policy_scope(Spot)
    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { spot: spot })
      }
    end
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
