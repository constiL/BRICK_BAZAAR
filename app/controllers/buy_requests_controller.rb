class BuyRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buy_request, only: %i[update destroy accept reject]

  def create
    @brick = Brick.find(params[:brick_id])
    @buy_request = BuyRequest.new(buy_request_params)
    @buy_request.brick = @brick
    @buy_request.user = current_user
    if @buy_request.save
      redirect_to brick_path(@brick), notice: "Buy request created"
    else
      redirect_to brick_path(@brick), notice: "Already made a buy request"
    end
  end

  def update
    if @buy_request.update(buy_request_params)
      redirect_to brickfolio_path, notice: "Buy request has been accepted"
    else
      redirect to brickfolio_path, notice: "Failure"
    end
  end

  def destroy
    @buy_request.destroy!
    redirect_to brick_path, notice: "Buy Request was successfully destroyed", status: :see_other
  end

  def accept
    if @buy_request.update(status: 'accepted')
      redirect_to brickfolio_path, notice: 'Buy request accepted'
    else
      redirect_to brickfolio_path, alert: 'Failed to accept buy request'
    end
  end

  def reject
    @buy_request.update(status: "rejected")
    @buy_request.destroy!
    redirect_to brickfolio_path, notice: "Buy Request has been rejected"
  end

  private

  def set_buy_request
    @buy_request = BuyRequest.find(params[:id])
  end

  def buy_request_params
    params.require(:buy_request).permit(:status)
  end
end
