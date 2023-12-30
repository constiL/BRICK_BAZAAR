class RemoveCountryFromBrick < ActiveRecord::Migration[7.1]
  def change
    remove_column :bricks, :country
  end
end
