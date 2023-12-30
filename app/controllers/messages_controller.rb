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
      redirect_to brick_chatroom_path(@brick, @chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
