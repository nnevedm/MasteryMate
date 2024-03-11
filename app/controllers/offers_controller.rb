# this is work in progres !!!

class OffersController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @offer = Offer.new(offer_params)
    @offer.request = @request

    if @offer.save
      redirect_to received_requests_path(@request), notice: "You offer has been saved and sent to the client."
    else
      render :show, status: :unprocessable_entity
      # what do I need to render?
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:content, :occurs_on, :time, :extra_costs, :reduction)
  end
end
