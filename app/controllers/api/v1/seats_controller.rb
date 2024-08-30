class Api::V1::SeatsController < ApplicationController
  def index
    render json: { status: 'success', records: Seat.all}
  end
end
