class UsersController < ApplicationController
  def show
    @user = current_user
    @bricks = @user.bricks
  end
end
