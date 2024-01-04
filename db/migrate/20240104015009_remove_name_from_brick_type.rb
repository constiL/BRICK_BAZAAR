class RemoveNameFromBrickType < ActiveRecord::Migration[7.1]
  def change
    remove_column :brick_types, :name
  end
end
