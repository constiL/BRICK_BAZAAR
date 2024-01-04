class AddCategoryAndSubCategoryToBrick < ActiveRecord::Migration[7.1]
  def change
    add_column :bricks, :category, :string
    add_column :bricks, :sub_category, :string
  end
end
