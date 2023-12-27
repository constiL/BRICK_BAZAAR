class MessagesController < ApplicationController

  def create
    @brick = Brick.find(params[:brick_id])
    @message = Message.new(message_params)
    @message.brick = @brick
    @message.user = current_user
    
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
