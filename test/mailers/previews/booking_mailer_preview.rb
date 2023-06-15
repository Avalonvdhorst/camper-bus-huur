# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview
  def new_booking_email
    # Set up a temporary booking for the preview
    booking = Booking.new(
      voornaam: "Joe",
      achternaam: "Smith",
      email: "joe@gmail.com",
      adres: "1-2-3 Chuo, Tokyo, 333-0000",
      telefoonnummer: "090-7777-8888",
      identiteitsbewijs: "kjh73876",
      startdatum: Date.new(2024, 8, 2),
      einddatum: Date.new(2024, 8, 16),
      bestuurder: "Joe Smith",
      geboortedatum: Date.new(1982, 11, 2),
      rijbewijsnummer: "9892838782"
    )

    BookingMailer.with(booking: booking).new_booking_email
  end
end
