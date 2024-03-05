class ExpertsController < ApplicationController
  def index
    @experts = Expert.all
  end

end
