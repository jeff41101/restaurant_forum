class AddingDefaultNameToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, default: "dummy"
  end
end
