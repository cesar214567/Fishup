class VerifyCatchSpotsController < ApplicationController
  def create
    catch_spot = CatchSpot.find(params[:catch_spot_id])
    spot = catch_spot.spot
    user = current_user
    verify_catch_spots = VerifyCatchSpot.new(catch_spot: catch_spot,user: user)
    verify_catch_spots.save
    authorize spot
    redirect_to spot_path(spot)
  end
end
