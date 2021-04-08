class AddingDefaultToFavoritesCountInRestaurant < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :favorites_count, :integer, default: 0
  end
end
