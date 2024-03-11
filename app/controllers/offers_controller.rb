# this is work in progres !!!

class OffersController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @offer = Offer.new(offer_params)
    @offer.request = @request

    if @offer.save
      redirect_to received_requests_path(@request), notice: "You offer has been saved and sent to the client."
    else
      render :new, status: :unprocessable_entity
      # what do I need to render?
    end
  end

  def accept
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    @offer.update(status: "Offer accepted")
    @request.update(status: "Offer accepted")
    if @offer.save
      redirect_to request_path(@request), notice: "You accepted the offer."
    else
      # what do I need to render?
    end
  end

  def decline
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    @offer.update(status: "Offer declined")
    @request.update(status: "Offer declined")
    if @offer.save
      redirect_to request_path(@request), notice: "You declined the offer."
    else
      # what do I need to render?
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:content, :occurs_on, :time, :extra_costs, :reduction)
  end
end
