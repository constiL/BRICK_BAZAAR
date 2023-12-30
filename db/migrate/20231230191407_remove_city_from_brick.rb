class RemoveCityFromBrick < ActiveRecord::Migration[7.1]
  def change
    remove_column :bricks, :city
  end
end
