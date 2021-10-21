class CatchSpotsController < ApplicationController
  def new
    @spot = Spot.find(params[:spot_id])
    @catch_spot = CatchSpot.new(spot:@spot)
    authorize @catch_spot
  end

  def create
    @catch_spot = CatchSpot.new(catch_spot_params)
    authorize @catch_spot
    if @catch_spot.save
      redirect_to spot_path(@catch_spot.spot)
    else
      redirect_to new_spot_catch_spot_path(@catch_spot.spot,@catch_spot)
    end
  end

  private

  def catch_spot_params
    params.require(:catch_spot).permit(:spot_id, :catch_id)
  end
end
