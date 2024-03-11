class MessagesController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @message = Message.new(message_params)
    @message.request = @request
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @request,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "requests/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
