class ChangeEndDateDatetimeToBookings < ActiveRecord::Migration[7.1]
  def change
    # change_column :bookings, :end_date_datetime, :datetime
    # rename_column :bookings, :end_date_datetime, :end_date

    remove_column :bookings, :end_date_datetime
    add_column :bookings, :end_date, :datetime
  end
end
