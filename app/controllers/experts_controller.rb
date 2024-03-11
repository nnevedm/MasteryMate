class ExpertsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @fields = Field.all

    @experts = Expert.all

    if params[:category].present?
      @experts = Expert.joins(:fields).where(fields: { expertise: params[:category] })
    end

    if params[:query].present?
      @experts = @experts.where("description ILIKE ?", "%#{params[:query]}%")
    end

    if params[:distance].present?
      # this is an arrow of all users near current user (I can't use Expert, because they are not geocoded)
      @users = User.near(current_user.address, params[:distance].to_i)
      # we need to filter this arrow to keep only the user that are experts, and replace the user by the expert
      @experts = []
      @users.each { |user| @experts << user.expert if user.expert.present? }
    end

    .uniq




    if params[:category].present? && params[:query].present? && params[:distance].present?

    elsif params[:category].present? && params[:query].present?

    elsif params[:query].present? && params[:distance].present?

    elsif params[:category].present? && params[:distance].present?

    elsif params[:category].present?
      @experts = Expert.joins(:fields).where(fields: { expertise: params[:category] })
    elsif params[:query].present?
      @experts = @experts.where("description ILIKE ?", "%#{params[:query]}%")
    elsif params[:distance].present?
      # this is an arrow of all users near current user (I can't use Expert, because they are not geocoded)
      @users = User.near(current_user.address, params[:distance].to_i)
      # we need to filter this arrow to keep only the user that are experts, and replace the user by the expert
      @experts = []
      @users.each { |user| @experts << user.expert if user.expert.present? }
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
