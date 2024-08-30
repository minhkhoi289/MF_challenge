class Api::V1::SeatsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { status: 'success', records: seats_payload(Seat.all.includes(:bookings))}
  end

  def show
    seat = Seat.find(params[:id])
    render json: { status: 'success', record: seat_payload(seat) }
  end

  private

  def seats_payload(seats, time: Time.now)
    seats.map do |seat|
      seat_payload(seat, time)
    end
  end

  def seat_payload(seat, time: Time.now)
    {
      id: seat.id,
      name: seat.name,
      available: seat.available?(time),
    }
  end
end
