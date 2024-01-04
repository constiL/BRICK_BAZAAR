class DropTableBrickType < ActiveRecord::Migration[7.1]
  def change
    drop_table :brick_types
  end
end
