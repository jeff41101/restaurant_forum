class AddImageToRestaurants < ActiveRecord::Migration[5.2]
  def change
    #table name, column name, data type
    add_column :restaurants, :image, :string
  end
end
