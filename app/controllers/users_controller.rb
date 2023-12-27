class UsersController < ApplicationController
  def show
    @user = current_user
    @bricks = @user.bricks
    @buy_requests = BuyRequest.where(user: @user)
  end
end
