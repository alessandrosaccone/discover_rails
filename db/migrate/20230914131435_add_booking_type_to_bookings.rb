class AddBookingTypeToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booking_type, :integer
  end
end
