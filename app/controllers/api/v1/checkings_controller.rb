class CheckingsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_time = Time.now

    booking = Booking.where(
      user_id: params[:user_id],
      seat_id: params[:seat_id],
    ).where('start_time >= ? AND end_time < ?', Time.now).first

    if booking.present?
      if Time.now - booking.start_time > 10.minutes
        booking.update(status: :expired)

        return render json: { status: 'error', message: 'You are late for this booking' }, status: :unprocessable_entity
      end

      render json: { status: 'success', message: 'You have a booking for this time' }, status: :ok
    else
      render json: { status: 'error', message: 'You do not have any bookings for this time' }, status: :unprocessable_entity
    end
  end
end
