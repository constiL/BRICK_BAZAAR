class BuyRequestsController < ApplicationController

  def create
    @buy_request = Buy_Request.new(buy_request_params)
    @brick = Brick.find(params[:brick_id])
    @buy_request.user = current_user
    if @buy_request.save
      redirect_to brickfolio_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @buy_request = Buy_Request.find(params[:id])
    brick = @buy_request.brick
    @buy_request.destroy!
    redirect_to brickfolio_path, notice: "Buy request was successfully removed", status: :see_other
  end

  private

  def buy_request_params
    params.require(:buy_request).permit(:accepted)
  end
end
