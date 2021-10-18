class LikedSpotsController < ApplicationController
  def create
    spot = Spot.find(params[:spot_id])
    user = current_user
    liked_spots = LikedSpot.new(spot: spot,user: user)
    liked_spots.save
    authorize spot
    redirect_to spot_path(spot)
  end
end
