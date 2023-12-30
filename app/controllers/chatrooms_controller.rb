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

  # create action for initiating a chatroom associated with a specific brick, seller and buyer combination only if one doesnt exist yet
  def create
    @brick = Brick.find(params[:brick_id])
    @seller = @brick.user
    @chatroom = Chatroom.find_by(buyer: current_user.id, seller: @seller) || Chatroom.find_by(buyer: @seller, seller: current_user.id)
    unless @chatroom
      @chatroom = Chatroom.new(brick: @brick, buyer: current_user, seller: @seller)
    end
    if @chatroom.save
      redirect_to brick_chatroom_path(@brick, @chatroom)
    else
      flash[:alert] = @chatroom.errors.full_messages.to_sentence
      redirect_to brick_path(@brick)
    end
  end

  def destroy
    @chatroom.destroy
    redirect_to chatrooms_path, notice: "Chat was successfully deleted"
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
