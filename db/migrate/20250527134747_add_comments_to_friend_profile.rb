class AddCommentsToFriendProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :friend_profiles, :comments, :text
  end
end
