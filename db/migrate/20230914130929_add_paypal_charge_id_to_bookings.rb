class AddPaypalChargeIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :paypal_charge_id, :string
  end
end
