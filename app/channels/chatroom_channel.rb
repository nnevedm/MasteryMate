class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    request = Request.find(params[:id])
    stream_for request
  end

  def unsubscribed
  end
end
