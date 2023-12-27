class BuyRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @buy_request = BuyRequest.new
    @brick = Brick.find(params[:brick_id])
    @buy_request.brick = @brick
    @buy_request.user = current_user
    if @buy_request.save
      redirect_to brick_path(@brick), notice: "Buy request created"
    else
      redirect_to brick_path(@brick), notice: "Already made a buy request"
    end
  end

  def destroy
    @buy_request = BuyRequest.find(params[:id])
    @buy_request.destroy!
    redirect_to brick_path, notice: "Buy Request was successfully destroyed", status: :see_other
  end
end
