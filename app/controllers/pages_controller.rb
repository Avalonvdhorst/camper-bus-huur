class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: :admin
  before_action :bookings_and_dates, only: ["home", "admin"]
  def home; end

  def huurvoorwaarden; end

  def admin
    @upcoming_bookings = Booking.where('einddatum > ?', Date.today)
    @past_bookings = Booking.where('einddatum < ?', Date.today)
  end

  private

  def bookings_and_dates
    @bookings = Booking.all
    @booking_dates = Booking.all.map { |booking| (booking.startdatum..booking.einddatum).to_a }.flatten
  end
end
