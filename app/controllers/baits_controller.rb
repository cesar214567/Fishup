class BaitsController < ApplicationController
  def index
    @baits = policy_scope(Bait).all
  end

  def show
    @bait = Bait.find(params[:id])
    authorize @bait
  end

  private

  def baits_params
    params.require(:bait).permit(:cost, :name, :description, :image)
  end
end
