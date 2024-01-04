class AddCategoryTypeToBrick < ActiveRecord::Migration[7.1]
  def change
    add_column :bricks, :category_type, :string
  end
end
