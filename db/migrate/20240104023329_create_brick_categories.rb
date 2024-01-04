class CreateBrickCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :brick_categories do |t|
      t.string :category
      t.string :sub_category
      t.string :size
      t.references :brick, null: false, foreign_key: true

      t.timestamps
    end
  end
end
