class AddRefundedToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :refunded, :boolean, default: false, null: false
  end
end
