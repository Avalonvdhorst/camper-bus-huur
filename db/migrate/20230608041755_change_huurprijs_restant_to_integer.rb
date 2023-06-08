class ChangeHuurprijsRestantToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :huurprijs, :integer
    change_column :bookings, :restant, :integer
  end
end
