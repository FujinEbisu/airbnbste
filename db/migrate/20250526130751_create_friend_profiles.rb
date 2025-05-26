class CreateFriendProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :friend_profiles do |t|
      t.string :username
      t.text :interest
      t.float :day_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
