class RenameHobbieToHobbies < ActiveRecord::Migration[7.1]
  def change
    rename_column :hobbies, :hobbie, :name
  end
end
