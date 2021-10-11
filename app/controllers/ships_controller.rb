class ShipsController < ApplicationController
  def index
    if params[:country].nil?
      if params[:ship].nil?
        @ships = policy_scope(Ship).where(ship_slice)
      else
        @ships = policy_scope(Ship).where(ship_slice_object)
      end
    else
      @ships = policy_scope(Ship).near(params[:country], 10_000)
    end
  end

  def new
    @ship = Ship.new
    authorize @ship
  end

  def create
    @ship = Ship.new(ship_params)
    @user = current_user
    @ship.user = @user
    if @ship.save
      authorize @ship
      redirect_to ship_path(@ship)
    else
      render :new
    end
  end

  def show
    @ship = Ship.find(params[:id])
    @ship_images = @ship.images.all
    @reservation = Reservation.new
    authorize @ship
  end

  private

  def ship_slice
    params.permit(:max_people, :price, :ship_type, :name)
  end

  def ship_slice_object
    temp = params.require(:ship).permit(:max_people, :price, :ship_type, :name)
    temp.reject { |key,value| value == ""}
  end

  def ship_params
    params.require(:ship).permit(:max_people,:price, :ship_type, :latitude, :longitude, :name, :description, images: [])
  end
end
