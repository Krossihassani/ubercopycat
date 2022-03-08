class AddFieldsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :date, :date
    add_column :bookings, :pick_up_time, :time
    add_column :bookings, :status, :boolean, default: false
  end
end
