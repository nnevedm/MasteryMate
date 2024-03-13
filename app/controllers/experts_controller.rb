class ExpertsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @fields = Field.all
    @experts = Expert.all

    # 1. set the variables (arrows of experts) depending on the different searches
    experts_category = []
    experts_query = []
    experts_distance = []

    if params[:category].present?
      experts_category = @experts.joins(:fields).where(fields: { expertise: params[:category] })
    end

    if params[:query].present?
      experts_query = @experts.where("description ILIKE ?", "%#{params[:query]}%")
    end

    if params[:distance].present?
      users = User.near(current_user.address, params[:distance].to_i)
      users.each { |user| experts_distance << user.expert if user.expert.present? }
    end

    # 2. make the different search scenarios
    if params[:category].present? && params[:query].present? && params[:distance].present?
      @experts = experts_category & experts_query & experts_distance
    elsif params[:category].present? && params[:query].present?
      @experts = experts_category & experts_query
    elsif params[:query].present? && params[:distance].present?
      @experts = experts_query & experts_distance
    elsif params[:category].present? && params[:distance].present?
      @experts = experts_category & experts_distance
    elsif params[:category].present?
      @experts = experts_category
    elsif params[:query].present?
      @experts = experts_query
    elsif params[:distance].present?
      @experts = experts_distance
    end
  end

  def new
    @expert = Expert.new
  end

  def create
    @expert = Expert.new(expert_params)
    @expert.user = current_user
    if @expert.save
      redirect_to experts_path, notice: "Congratulations, your profile is now visible to visitors!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expert_params
    params.require(:expert).permit(:description, :price_per_hour, field_ids: [])
  end
end
