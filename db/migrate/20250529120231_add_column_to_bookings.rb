class AddColumnToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :accepted, :boolean, default: nil
  end
end
