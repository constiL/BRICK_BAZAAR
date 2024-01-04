class BricksController < ApplicationController
  before_action :set_brick, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @bricks = Brick.order(name: :asc, colour: :asc)
    # take user input to display bricks according to their search
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR colour ILIKE :query OR category ILIKE :query OR sub_category ILIKE :query OR size ILIKE :query OR category_type ILIKE :query"
      @bricks = @bricks.where(sql_subquery, query: "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: "list", locals: { bricks: @bricks }, formats: [:html] }
    end
  end

  def show
    @buy_request = BuyRequest.new
    @chatroom = Chatroom.new
    @message = Message.new
    @current_user = current_user
  end

  def new
    @brick = Brick.new
  end

  def create
    @brick = Brick.new(brick_params)
    @brick_category = BrickCategory.new
    @brick.user = current_user
    if @brick.save
      redirect_to @brick, notice: "Brick was succesfully added to the market"
    else
      logger.debug @brick.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
  end

  def update
    @brick.user = current_user
    if @brick.update(brick_params)
      respond_to do |format|
        format.html { redirect_to brickfolio_path, notice: "Brick was succesfully updated" }
        format.text { render partial: "bricks/brick_update", locals: { brick: @brick }, formats: [:html] }
      end
    else
      respond_to do |format|
        format.text { render partial: "bricks/brick_update", locals: { brick: @brick }, formats: [:html] }
      end
    end
  end

  def destroy
    @brick.user = current_user
    @brick.destroy
    redirect_to brickfolio_path, notice: "Brick was sucessfully deleted", status: :see_other
  end

  # action to display map with custom marker as well as pop up with extra info
  def map
    @bricks = Brick.all
    @markers = @bricks.geocoded.map do |brick|
      {
        lat: brick.latitude,
        lng: brick.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {brick: brick}),
        marker_html: render_to_string(partial: "marker", locals: {brick: brick})
      }
    end
  end

  private

  def set_brick
    @brick = Brick.find(params[:id])
  end

  def brick_params
    params.require(:brick).permit(:name, :description, :address, :price, :brick_condition, :colour, :photo, :category, :sub_category, :size, :category_type)
  end
end
