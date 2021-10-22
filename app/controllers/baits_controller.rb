class BaitsController < ApplicationController
  def index
    if params[:query].present?
      @baits = policy_scope(Bait).general_search(params[:query])
    else
      @baits = policy_scope(Bait)
    end
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
