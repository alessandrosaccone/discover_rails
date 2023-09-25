class AddTransfertoguideToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :transfertoguide, :boolean, default: false
  end
end
