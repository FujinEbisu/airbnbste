class AddCoordinatesToFriendProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :friend_profiles, :latitude, :float
    add_column :friend_profiles, :longitude, :float
  end
end
