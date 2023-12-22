class CreateBricks < ActiveRecord::Migration[7.1]
  def change
    create_table :bricks do |t|
      t.string :name
      t.string :description
      t.string :city
      t.string :address
      t.integer :price
      t.integer :brick_condition
      t.string :colour
      t.float :longitude
      t.float :latitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
