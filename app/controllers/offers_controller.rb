class OffersController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @offer = Offer.new(offer_params)
    @offer.request = @request

    if @offer.save
      redirect_to request_received_path(@request), notice: "You offer has been saved and sent to the client."
      # else
      #   notice: "There was an error saving your offer. Try again and make sure you filled each field correctly."
    end

    @request.update(status: "Offer made")
  end

  def update
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)

    if @offer.save
      redirect_to request_received_path(@request), notice: "You offer has been edited and sent to the client."
      # no route matching?
    # else
    #   notice: "There was an error saving your offer. Try again and make sure you filled each field correctly."
    end
  end

  def accept
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    @offer.update(status: "Offer accepted")
    @request.update(status: "Offer accepted")
    @offer.save
    redirect_to request_path(@request), notice: "You accepted the offer."
  end

  def decline
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:id])
    @offer.update(status: "Offer declined")
    @request.update(status: "Offer declined")
    @offer.save
    redirect_to request_path(@request), notice: "You declined the offer."
  end

  private

  def offer_params
    params.require(:offer).permit(:content, :occurs_on, :time, :extra_costs, :reduction)
  end
end
