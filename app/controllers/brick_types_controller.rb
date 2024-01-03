class BrickTypesController < ApplicationController
  def filter_sub_category
    category = params[:category]
    sub_categories = BrickType.where(category: category).distinct.pluck(:sub_category)
    render json: sub_categories
  end

  def filter_size
  end

  def filter_name
  end
end
