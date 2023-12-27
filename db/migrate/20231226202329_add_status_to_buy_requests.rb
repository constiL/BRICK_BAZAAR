class AddStatusToBuyRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :buy_requests, :status, :integer, default: 0
    add_index :buy_requests, :status
  end
end
