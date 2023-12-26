class BuyRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @buy_request = BuyRequest.new
    @brick = Brick.find(params[:brick_id])
    @buy_request.brick = @brick
    @buy_request.user = current_user
    if @buy_request.save
      redirect_to bricks_path, notice: "Buy Request created"
    else
      redirect_to brick_path, notice: "failure"
    end
  end

  def destroy
    @buy_requests = BuyRequest.find(params[:id])
    @brick = @buy_request.brick
    if @buy_request.destroy!
      redirect_to bricks_path, notice: "Buy Request was successfully destroyed", status: :see_other
    else
  end
end
