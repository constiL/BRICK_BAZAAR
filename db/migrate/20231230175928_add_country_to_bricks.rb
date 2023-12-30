class AddCountryToBricks < ActiveRecord::Migration[7.1]
  def change
    add_column :bricks, :country, :string
  end
end
