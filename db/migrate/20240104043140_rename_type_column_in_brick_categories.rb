class RenameTypeColumnInBrickCategories < ActiveRecord::Migration[7.1]
  def change
    rename_column :brick_categories, :type, :category_type
  end
end
