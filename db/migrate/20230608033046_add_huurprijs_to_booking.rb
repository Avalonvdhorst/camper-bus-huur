class AddHuurprijsToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :huurprijs, :float
  end
end
