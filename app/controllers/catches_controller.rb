class CatchesController < ApplicationController

  def index
    if params[:query].present?
      @catches = policy_scope(Catch).general_search(params[:query]).page params[:page]
    else
      @catches = policy_scope(Catch).page params[:page]
    end
  end

  def show
    @catch = Catch.find(params[:id])
    authorize @catch
  end
end
