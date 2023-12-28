class ChatroomsController < ApplicationController
  def show
    @brick = Brick.find(params[:brick_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @brick = Brick.find(params[:brick_id])
    @seller = @brick.user
    @chatroom = Chatroom.find_by(buyer: current_user.id, seller: @seller)
    if @chatroom.save
      redirect_to brick_chatroom_path(@brick, @chatroom), notice: "chat created"
    else
      redirect_to bricks_path, notice: "failure"
    end
  end
end
