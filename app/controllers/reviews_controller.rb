class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @request = Request.find(params[:request_id])
    @expert = Expert.find(params[:expert_id])
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @review = Review.new(review_params)
    @expert = Expert.find(params[:expert_id])
    @request = Request.find(params[:request_id])
    @offer = Offer.find(params[:offer_id])
    @review.expert = @expert
    @review.user = current_user
    if @review.save
      redirect_to my_requests_path, notice: "Thank you for your review"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
