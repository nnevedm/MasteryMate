class RequestsController < ApplicationController
  def index
    @requests = Request.where(user: current_user)
  end

  def show
    @request = Request.find(params[:id])
    @requests = Request.where(user: current_user)
  end

  def new
    @request = Request.new
    @expert = Expert.find(params[:expert_id])
  end

  def create
    @request = Request.new(request_params)
    @expert = Expert.find(params[:expert_id])
    @request.expert = @expert
    @request.user = current_user
    @request.address = current_user.address # this will need to be adapted when the address can be different
    if @request.save
      redirect_to experts_path, notice: "The expert has been notified. You'll soon be able to follow the status on a beautiful dashboard we're building for you 😜"
      # the redirect will change to the requests index
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :estimated_time, :address, pictures: [])
  end
end
