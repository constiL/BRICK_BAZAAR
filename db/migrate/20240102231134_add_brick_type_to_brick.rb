class AddBrickTypeToBrick < ActiveRecord::Migration[7.1]
  def change
    add_reference :bricks, :brick_type, foreign_key: { to_table: :bricks }
  end
end
