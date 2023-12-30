class AddPostalCodeToBricks < ActiveRecord::Migration[7.1]
  def change
    add_column :bricks, :postal_code, :string
  end
end
