class ChatroomsController < ApplicationController
  def show
    @brick = Brick.find(params[:brick_id])
    @chatroom = Chatroom.find(params[:id])
    @buyer = @chatroom.buyer
    @seller = @chatroom.seller
    @message = Message.new
  end

  def create
    @brick = Brick.find(params[:brick_id])
    @seller = @brick.user
    @chatroom = Chatroom.new(brick: @brick, buyer: current_user, seller: @seller)
    if @chatroom.save
      redirect_to brick_chatroom_path(@brick, @chatroom), notice: "Chat created"
    else
      flash[:alert] = @chatroom.errors.full_messages.to_sentence
      redirect_to brick_path(@brick)
    end
  end
end
