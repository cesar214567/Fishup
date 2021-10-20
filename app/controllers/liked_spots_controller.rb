class LikedSpotsController < ApplicationController
  def create
    spot = Spot.find(params[:spot_id])
    user = current_user
    liked_spots = LikedSpot.new(spot: spot,user: user)
    liked_spots.save
    authorize spot
     if params[:map]
      redirect_to spots_path
    else
    redirect_to spot_path(spot)
    end
  end

  def destroy
    liked_spot = LikedSpot.find(params[:id])
    authorize liked_spot
    liked_spot.destroy
    @spot = liked_spot.spot
    if params[:map].present?
      redirect_to spots_path
    else
    redirect_to spot_path(@spot)
    end
  end
end
