class RequestsController < ApplicationController
  def show
    @request = Request.find(params[:id])
    @requests = Request.where(user: current_user)
  end
end
