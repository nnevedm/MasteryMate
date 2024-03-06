class RequestsController < ApplicationController



  private

  def request_params
    params.require(:request).permit(:title, :description, :estimated_time, :address, pictures: [])
  end


end
