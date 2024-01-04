class BrickCategoriesController < ApplicationController
  def filter_sub_category
    category = params[:category]
    sub_categories = BrickCategory.where(category: category).distinct.pluck(:sub_category)
    render json: sub_categories
  end

  def filter_size
    # category = params[:category]
    sub_category = params[:sub_category]
    category_type = "Size"
    sizes = BrickCategory.where(sub_category: sub_category, category: category, category_type: category_type).distinct.pluck(:size)
    render json: sizes
  end
end
