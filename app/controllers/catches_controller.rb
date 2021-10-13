class CatchesController < ApplicationController

  def index
    @catches = policy_scope(Catch)
  end
  def show
    @catch = Catch.find(params[:id])
    authorize @catch
  end


end
