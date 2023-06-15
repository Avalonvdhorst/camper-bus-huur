class BookingsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      huurprijs_restant
      BookingMailer.with(booking: @booking).new_booking_email.deliver_later
      redirect_to root_path, notice: 'Booking geslaagd'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def download_pdf
    @booking = Booking.find(params[:id])
    send_file "#{Rails.root}/pdfs/#{@booking.voornaam}-#{@booking.achternaam}-#{@booking.identiteitsbewijs}.pdf", type: "application/pdf", x_sendfile: true
  end

  def block
    @booking = Booking.new
  end

  def block_dates
    @booking = Booking.new(block_params)
    if @booking.save
      redirect_to admin_path, notice: "Gelukt! Datums zijn geblokkeerd"
    else
      redirect_to admin_path, notice: "Sorry er is iets mis gegaan, neem contact op met Ava"
    end
  end

  private

  def booking_params
    params.require(:booking)
          .permit(:voornaam, :achternaam, :adres, :woonplaats,
                  :telefoonnummer, :mobiel, :email, :identiteitsbewijs,
                  :startdatum, :einddatum, :bestuurder, :geboortedatum,
                  :rijbewijsnummer, :bestuurder_twee, :geboortedatum_twee,
                  :rijbewijsnummer_twee)
  end

  def block_params
    {
      voornaam: "De",
      achternaam: "Familie",
      adres: "Vinkenhof",
      woonplaats: "Stadskanaal",
      telefoonnummer: "0599622237",
      email: "rjvanderhorst@ziggo.nl",
      identiteitsbewijs: "123456",
      startdatum: params[:booking][:startdatum],
      einddatum: params[:booking][:einddatum],
      bestuurder: "Familie",
      geboortedatum: "1957-09-20",
      rijbewijsnummer: "654321"
    }
  end

  def huurprijs_restant
    @booking.huurprijs = ((@booking.einddatum - @booking.startdatum).to_i / 7) * 870
    @booking.restant = @booking.huurprijs - 680
  end
end
