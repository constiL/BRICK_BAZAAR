class DropTables < ActiveRecord::Migration[7.1]
  def up
    drop_table :buy_requests
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
