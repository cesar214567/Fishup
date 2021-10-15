class CatchesController < ApplicationController

  def index
    if params[:query].present?
      @catches = policy_scope(Catch.joins(:spots, :baits)).general_search(params[:query])
    else
      @catches = policy_scope(Catch)
    end
  end

  def show
    @catch = Catch.find(params[:id])
    authorize @catch
  end
end
