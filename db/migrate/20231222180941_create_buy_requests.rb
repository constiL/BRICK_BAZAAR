class CreateBuyRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :buy_requests do |t|
      t.boolean :accepted
      t.references :brick, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
