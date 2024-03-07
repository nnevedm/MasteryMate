class ExpertsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @fields = Field.all

    @experts = Expert.all
    if params[:category].present?
      raise
      # @experts = @experts.where(field: params[:category])
    end
    if params[:query].present?
      @experts = @experts.where("description ILIKE ?", "%#{params[:query]}%")
    end

  end

  def new
    @expert = Expert.new
  end

  def create
    @expert = Expert.new(expert_params)
    @expert.user = current_user
    if @expert.save
      redirect_to experts_path, notice: "Congratulations, your profile is now visible to visitors!" # path needs to be updated to experts#show page
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expert_params
    params.require(:expert).permit(:description, :price_per_hour, field_ids: [])
  end
end
