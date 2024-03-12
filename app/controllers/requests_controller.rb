class RequestsController < ApplicationController
  # this is for "my requests", the index of user's request
  def index
    @all_requests = Request.where(user: current_user).order(updated_at: :desc)
    @past_requests = @all_requests.select { |request| request.offer.occurs_on < Time.now if request.offer.present? }
    @cancelled_requests = @all_requests.where(status: "Cancelled")
    @pending_requests = @all_requests - @past_requests - @cancelled_requests
  end

  # this is for "my requests", the show page of user's request
  def show
    @request = Request.find(params[:id])
    @all_requests = Request.where(user: current_user).order(updated_at: :desc)
    @past_requests = @all_requests.select { |request| request.offer.occurs_on < Time.now if request.offer.present? }
    @cancelled_requests = @all_requests.where(status: "Cancelled")
    @pending_requests = @all_requests - @past_requests - @cancelled_requests
    @message = Message.new
  end

  # this is for "requests received", the index of all requests an expert received
  def requests_received
    @all_requests = Request.where(expert: current_user.expert).order(updated_at: :desc)
    rejected_requests = @all_requests.where(status: "Rejected")
    @cancelled_requests = @all_requests.where(status: "Cancelled")
    @past_requests = @all_requests.select { |request| request.offer.occurs_on < Time.now if request.offer.present? }
    @pending_requests = @all_requests - rejected_requests - @past_requests - @cancelled_requests
  end

  # this is for "requests received", the show of each request an expert received
  def requests_received_show
    @all_requests = Request.where(expert: current_user.expert).order(updated_at: :desc)
    rejected_requests = @all_requests.where(status: "Rejected")
    @cancelled_requests = @all_requests.where(status: "Cancelled")
    @past_requests = @all_requests.select { |request| request.offer.occurs_on < Time.now if request.offer.present? }
    @pending_requests = @all_requests - rejected_requests - @past_requests - @cancelled_requests

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

  def cancel
    @request = Request.find(params[:id])
    @request.update(status: "Cancelled")
    @request.save
    redirect_to my_requests_path, notice: "The request has been cancelled."
  end

  def destroy_client_request
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_received_path, status: :see_other, notice: "The request has been deleted."
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :estimated_time, :address, pictures: [])
  end
end
