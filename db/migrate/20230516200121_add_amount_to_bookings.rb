class AddAmountToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :amount, :decimal
  end
end
