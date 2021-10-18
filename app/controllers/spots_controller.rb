class SpotsController < ApplicationController
  def index
    @spots = policy_scope(Spot)
    if params[:query].present?
      @spots = policy_scope(Spot).general_search(params[:query])
    end
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
    @posts = Post.all
    authorize @spot
  end


  def new
    @spot = Spot.new
    @catches = Catch.all
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
