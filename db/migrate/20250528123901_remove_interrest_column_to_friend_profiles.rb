class RemoveInterrestColumnToFriendProfiles < ActiveRecord::Migration[7.1]
  def change
    remove_column :friend_profiles, :interest
  end
end
