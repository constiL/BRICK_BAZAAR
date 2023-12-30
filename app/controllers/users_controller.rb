class UsersController < ApplicationController
  # gather information related to current_user (bricks, buy_requests(seller&buyer), chatrooms)
  def show
    @user = current_user
    @bricks = @user.bricks
    buyer_requests = BuyRequest.where(user: @user)
    seller_requests = BuyRequest.joins(:brick).where(bricks: { user_id: @user.id })
    @buy_requests = buyer_requests.to_a + seller_requests.to_a
    @chatrooms = Chatroom.where(buyer: current_user).or(Chatroom.where(seller: current_user))
  end
end
