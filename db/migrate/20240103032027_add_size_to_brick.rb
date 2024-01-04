class AddSizeToBrick < ActiveRecord::Migration[7.1]
  def change
    add_column :bricks, :size, :string
  end
end
