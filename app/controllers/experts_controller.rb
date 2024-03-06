class ExpertsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @experts = Expert.all
  end

  def new
    @expert = Expert.new
  end

  def create
    @expert = Expert.new(expert_params)
    @expert.user = current_user
    if @expert.save
      redirect_to root_path # path needs to be updated
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expert_params
    params.require(:expert).permit(:description, :price_per_hour)
  end
end
