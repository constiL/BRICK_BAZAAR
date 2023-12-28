class RemoveBrickIdFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :messages, :brick, index: true, foreign_key: true
  end
end
