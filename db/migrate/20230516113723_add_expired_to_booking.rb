class AddExpiredToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :expired, :boolean, default: false
  end
end
