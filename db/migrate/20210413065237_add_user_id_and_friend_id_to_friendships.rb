class AddUserIdAndFriendIdToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :user_id, :integer
    add_column :friendships, :friend_id, :integer
  end
end
