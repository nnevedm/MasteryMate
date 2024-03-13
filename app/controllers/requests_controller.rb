class RequestsController < ApplicationController
  before_action :set_user_request, only: %i[index show]
  before_action :set_expert_request, only: %i[requests_received requests_received_show]

  # my resquests > index, for USER
  def index
    # before action
  end

  # my resquests > show, for USER
  def show
    # before action
    @request = Request.find(params[:id])
    @message = Message.new
  end

  # requests received" > index, for EXPERT
  def requests_received
    # before action
  end

  # requests received" > show, for EXPERT
  def requests_received_show
    # before action
    @request = Request.find(params[:id])
    @message = Message.new
    @expert = @request.expert

    if @request.offer.present? && (@request.status == "Offer made" || @request.status == "Offer declined")
      @offer = @request.offer
    else
      @offer = Offer.new
    end
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
    @request.address = current_user.address
    if @request.save
      redirect_to request_path(@request), notice: "The expert has been notified."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def reject
    @request = Request.find(params[:id])
    @request.update(status: "Rejected")
    @request.save
    redirect_to requests_received_path, notice: "The request has been rejected."
  end

  def destroy_rejected_request
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to my_requests_path, status: :see_other, notice: "The request has been deleted."
  end

  def cancel
    @request = Request.find(params[:id])
    @request.update(status: "Cancelled")
    @request.save
    redirect_to my_requests_path, notice: "The request has been cancelled."
  end

  def destroy_cancelled_request
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_received_path, status: :see_other, notice: "The request has been deleted."
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :estimated_time, :address, pictures: [])
  end

  # question for Pedro, lots of the code is the same, can we further refactor?
  def set_user_request
    all_requests = Request.where(user: current_user).order(updated_at: :desc)
    @rejected_requests = all_requests.where(status: "Rejected")
    @cancelled_requests = all_requests.where(status: "Cancelled")
    @past_requests = all_requests.select { |request| request.offer.occurs_on.to_date < Date.today if request.status == "Offer accepted" }
    @pending_requests = all_requests - @rejected_requests - @cancelled_requests - @past_requests
  end

  def set_expert_request
    all_requests = Request.where(expert: current_user.expert).order(updated_at: :desc)
    @rejected_requests = all_requests.where(status: "Rejected")
    @cancelled_requests = all_requests.where(status: "Cancelled")
    @past_requests = all_requests.select { |request| request.offer.occurs_on.to_date < Date.today if request.status == "Offer accepted" }
    @pending_requests = all_requests - @rejected_requests - @cancelled_requests - @past_requests
  end
end
