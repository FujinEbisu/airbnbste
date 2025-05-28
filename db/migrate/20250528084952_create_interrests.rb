class CreateInterrests < ActiveRecord::Migration[7.1]
  def change
    create_table :interrests do |t|
      t.references :hobbie, null: false, foreign_key: true
      t.references :friend_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
