class Api::V1::BookingsController < ApplicationController
  def index
    render json: { status: 'success', records: Booking.all }
  end
end
