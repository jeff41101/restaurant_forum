class CreateAddAttributeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :intro, :text
    add_column :users, :avatar, :string
    end
end
