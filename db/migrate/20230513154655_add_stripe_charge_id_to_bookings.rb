class AddStripeChargeIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :stripe_charge_id, :string
  end
end
