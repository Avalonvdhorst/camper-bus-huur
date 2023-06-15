class BookingMailer < ApplicationMailer
  def new_booking_email
    @booking = params[:booking]

    mail(to: "avalonvdhorst@gmail.com", subject: "Er is een nieuwe boeking!")
  end
end
