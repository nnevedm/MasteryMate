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
  end

  private

  def offer_params
    params.require(:offer).permit(:content, :occurs_on, :time, :extra_costs, :reduction)
  end
end
