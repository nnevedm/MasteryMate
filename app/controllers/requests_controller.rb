class RequestsController < ApplicationController

  # this is for "my requests", the index of user's request
  def index
    @requests = Request.where(user: current_user).order(updated_at: :desc)
    # question for Nico/Geoffroy: do we want to sort based on creation date or update? (need to updated x4 below)
  end

  # this is for "my requests", the show page of user's request
  def show
    @request = Request.find(params[:id])
    @requests = Request.where(user: current_user).order(updated_at: :desc)
  end

  # this is for "requests received", the index of all requests an expert received
  def requests_received
    @requests = Request.where(expert: current_user.expert).order(updated_at: :desc)
  end

  # this is for "requests received", the show of each request an expert received
  def requests_received_show
    @offer = Offer.new
    @request = Request.find(params[:id])
    @requests = Request.where(expert: current_user.expert).order(updated_at: :desc)
    @expert = @request.expert
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
      redirect_to my_requests_path, notice: "The expert has been notified."
      # the redirect will change to the requests index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def reject
    @request = Request.find(params[:id])
    @request.update(status: "Rejected")
    @request.save
    redirect_to requests_received_path, notice: "The request was rejected."
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :estimated_time, :address, pictures: [])
  end
end
