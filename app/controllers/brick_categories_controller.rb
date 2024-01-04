class BrickCategoriesController < ApplicationController
  def filter_sub_category
    category = params[:category]
    sub_categories = BrickCategory.where(category: category).distinct.pluck(:sub_category)
    render json: sub_categories
  end

  def filter_size
    category = params[:category]
    sub_category = params[:sub_category]
    sizes = BrickCategory.where(sub_category: sub_category, category: category).distinct.pluck(:size)
    render json: sizes
  end

  def filter_category_type
    category = params[:category]
    sub_category = params[:sub_category]
    size = params[:size]
    category_types = BrickCategory.where(sub_category: sub_category, category: category, size: size).distinct.pluck(:category_type)
    render json: category_types
  end
end
