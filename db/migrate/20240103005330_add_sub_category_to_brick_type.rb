class AddSubCategoryToBrickType < ActiveRecord::Migration[7.1]
  def change
    add_column :brick_types, :sub_category, :string
  end
end
