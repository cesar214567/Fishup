class CatchesController < ApplicationController

  def index
    @catches = policy_scope(Catch)
  end

end
