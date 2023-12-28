class UsersController < ApplicationController
  def show
    @user = current_user
    @bricks = @user.bricks
    @buy_requests = BuyRequest.where(user: @user)
    @chatrooms = Chatroom.where(buyer: current_user).or(Chatroom.where(seller: current_user))
  end
end
