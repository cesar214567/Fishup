class VotedSpotsController < ApplicationController

  def create
    spot = Spot.find(params[:spot_id])
    user = current_user
    voted_spots = VotedSpot.new(spot: spot,user: user)
    voted_spots.save
    authorize spot
    redirect_to spot_path(spot)
  end
end
