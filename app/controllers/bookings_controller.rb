class BookingsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path, notice: 'Request was successfully created.'
    else
      render :new, status: :unprocessable_entity
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
end
