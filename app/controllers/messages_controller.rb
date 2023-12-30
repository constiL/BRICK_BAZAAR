class MessagesController < ApplicationController

  # create action for adding a new message to chatroom associated with a specific brick
  def create
    @brick = Brick.find(params[:brick_id])
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @username = @message.user.username
    if @message.save
      
      # broadcast new message to respective chatroom
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok

    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
