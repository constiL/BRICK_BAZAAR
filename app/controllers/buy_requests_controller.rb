class BuyRequestsController < ApplicationController
  before_action :authenticate_user!
  def new
    @brick = Brick.find(params[:brick_id])
    @buy_request = BuyRequest.new
  end

  def create
    @buy_request = BuyRequest.new(buy_request_params)
    @brick = Brick.find(params[:brick_id])
    @buy_request.brick = @brick
    @buy_request.user = current_user
    if @buy_request.save
      redirect_to brickfolio_path, notice: "buy request successfully made"
    else
      render redirect_to bricks_path
    end
  end

  def destroy
    @buy_request = BuyRequest.find(params[:id])
    brick = @buy_request.brick
    @buy_request.destroy!
    redirect_to brickfolio_path, notice: "Buy request was successfully removed", status: :see_other
  end

  private

  def buy_request_params
    params.require(:buy_request).permit(:accepted)
  end
end
