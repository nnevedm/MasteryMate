class RequestsController < ApplicationController
  def index
    @requests = Request.where(user: current_user)
  end

  def show
    @request = Request.find(params[:id])
    @requests = Request.where(user: current_user)
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :estimated_time, :address, photos: [])
  end
end
