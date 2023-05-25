# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_24_063154) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "voornaam"
    t.string "achternaam"
    t.string "adres"
    t.string "woonplaats"
    t.string "telefoonnummer"
    t.string "mobiel"
    t.string "email"
    t.string "identiteitsbewijs"
    t.date "startdatum"
    t.date "einddatum"
    t.string "bestuurder"
    t.string "geboortedatum"
    t.string "rijbewijsnummer"
    t.string "bestuurder_twee"
    t.string "geboortedatum_twee"
    t.string "rijbewijsnummer_twee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
