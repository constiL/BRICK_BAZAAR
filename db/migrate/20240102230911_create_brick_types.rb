class CreateBrickTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :brick_types do |t|
      t.string :name
      t.string :category
      t.string :size

      t.timestamps
    end
  end
end
