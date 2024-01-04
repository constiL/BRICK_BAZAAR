class RemoveBrickTypeReferenceFromBrick < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bricks, :brick_type
  end
end
