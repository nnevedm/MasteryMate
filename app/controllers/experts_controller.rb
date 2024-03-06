class ExpertsController < ApplicationController
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
      redirect_to root_path,  notice: "Congratulations, visitors can now request your services!" # path needs to be updated
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expert_params
    params.require(:expert).permit(:description, :price_per_hour)
  end
end
