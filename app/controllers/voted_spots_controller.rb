class VotedSpotsController < ApplicationController

  def create
    spot = Spot.find(params[:spot_id])
    user = current_user
    voted_spots = VotedSpot.new(spot: spot,user: user)
    voted_spots.save
    authorize spot
    redirect_to spot_path(spot)
  end

  def destroy
    voted_spot = VotedSpot.find(params[:id])
    authorize voted_spot
    voted_spot.destroy
    @spot = voted_spot.spot
    redirect_to spot_path(@spot)
  end
end
