class AddAddressToFriendProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :friend_profiles, :address, :string
    add_column :friend_profiles, :radius, :integer
  end
end
