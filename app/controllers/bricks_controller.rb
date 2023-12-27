class BricksController < ApplicationController
  before_action :set_brick, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @bricks = Brick.all
  end

  def show
    @buy_request = BuyRequest.new
    @message = Message.new
  end

  def new
    @brick = Brick.new
  end

  def create
    @brick = Brick.new(brick_params)
    @brick.user = current_user
    if @brick.save
      redirect_to @brick, notice: "Brick was succesfully added to the market"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
  end

  def update
    @brick.user = current_user
    if @brick.update(brick_params)
      redirect_to @brick, notice: "Brick was succesfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @brick.user = current_user
    @brick.destroy!
    redirect_to bricks_path, notice: "Brick was sucessfully deleted", status: :see_other
  end

  private

  def set_brick
    @brick = Brick.find(params[:id])
  end

  def brick_params
    params.require(:brick).permit(:name, :description, :city, :address, :price, :brick_condition, :colour)
  end
end
