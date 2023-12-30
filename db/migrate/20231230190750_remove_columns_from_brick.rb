class RemoveColumnsFromBrick < ActiveRecord::Migration[7.1]
  def change
    remove_column :bricks, :postal_code
  end
end
