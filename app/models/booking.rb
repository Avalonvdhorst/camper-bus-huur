class Booking < ApplicationRecord
  validates :voornaam, :achternaam, :adres, :woonplaats, :telefoonnummer, presence: true
  validates :email, :identiteitsbewijs, :bestuurder, :geboortedatum, :rijbewijsnummer, presence: true
  validates :startdatum, :einddatum, presence: true

  validate :no_overlapping_bookings
  validate :start_and_end_on_friday
  validate :start_and_end_date_not_in_past

  private

  def no_overlapping_bookings
    overlapping_bookings = Booking.where('id != ?', id)
                                  .where('startdatum < ? AND einddatum > ?', einddatum, startdatum)

    errors.add(:base, 'De camper is op deze data helaas al geboekt') if overlapping_bookings.exists?
  end

  def start_and_end_on_friday
    errors.add(:startdatum, 'moet op een vrijdag vallen') if startdatum.present? && startdatum.wday != 5
    errors.add(:einddatum, 'moet op een vrijdag vallen') if einddatum.present? && einddatum.wday != 5
  end

  def start_and_end_date_not_in_past
    errors.add(:startdatum, 'kan niet in het verleden zijn') if startdatum.present? && startdatum < Date.today
    errors.add(:einddatum, 'kan niet in het verleden zijn') if einddatum.present? && einddatum < Date.today
  end
end
