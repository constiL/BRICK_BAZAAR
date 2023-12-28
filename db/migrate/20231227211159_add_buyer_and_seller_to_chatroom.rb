class AddBuyerAndSellerToChatroom < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :buyer, foreign_key: { to_table: :users }
    add_reference :chatrooms, :seller, foreign_key: { to_table: :users }
  end
end
