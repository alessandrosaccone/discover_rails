class AddNumPersToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :num_pers, :integer
  end
end
