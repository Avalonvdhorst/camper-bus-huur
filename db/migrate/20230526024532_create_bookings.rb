class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :voornaam
      t.string :achternaam
      t.string :adres
      t.string :woonplaats
      t.string :telefoonnummer
      t.string :mobiel
      t.string :email
      t.string :identiteitsbewijs
      t.date :startdatum
      t.date :einddatum
      t.string :bestuurder
      t.date :geboortedatum
      t.string :rijbewijsnummer
      t.string :bestuurder_twee
      t.date :geboortedatum_twee
      t.string :rijbewijsnummer_twee

      t.timestamps
    end
  end
end
