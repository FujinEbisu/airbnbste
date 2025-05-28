class RenameHobbieToInterrests < ActiveRecord::Migration[7.1]
  def change
    rename_column :interrests, :hobbie_id, :hobby_id
  end
end
