class AddTypeToBrickCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :brick_categories, :type, :string
  end
end
