class AddDefaultToAcceptedInBuyRequests < ActiveRecord::Migration[7.1]
  def change
    change_column :buy_requests, :accepted, :boolean, default: false, null: false
  end
end
