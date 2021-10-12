class BaitsController < ApplicationController
  def index
    @baits = policy_scope(Bait).all
  end

  def show
    @bait = policy_scope(Bait).find(params[:id])
  end

  private

  def baits_params
    params.require(:bait).permit(:cost, :name, :description, :image)
  end
end
