class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show destroy]

  def index
    @chatrooms = Chatroom.where(buyer: current_user).or(Chatroom.where(seller: current_user))
  end

  def show
    @brick = Brick.find(params[:brick_id])
    @buyer = @chatroom.buyer
    @seller = @chatroom.seller
    @seller = @brick.user
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

  def destroy
    @chatroom.destroy
    redirect_to brickfolio_path, notice: "Chat was successfully deleted"
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
