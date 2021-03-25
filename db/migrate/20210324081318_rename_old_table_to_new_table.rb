class RenameOldTableToNewTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :restauramts, :restaurants
  end
end
