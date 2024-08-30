class Api::V1::BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    byebug
    bookings = Booking.where(status: :booked)
    bookings = bookings.where(user_id: params[:user_filter_id]) if params[:user_filter_id]
    bookings = bookings.where(seat_id: params[:seat_id]) if params[:seat_id]

    render json: { status: 'success', records: bookings }
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      render json: { status: 'success', record: booking }
    else
      render json: { status: 'error', errors: booking.errors.full_messages }, status: :bad_request
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:seat_id, :user_id, :start_time, :end_time).tap do |p|
      p[:start_time] = DateTime.parse(p[:start_time]) if p[:start_time]
      p[:end_time] = DateTime.parse(p[:end_time]) if p[:end_time]
    end.merge(status: 'booked')
  end
end
