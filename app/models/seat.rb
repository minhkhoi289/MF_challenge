class Seat < ApplicationRecord
  has_many :bookings

  def available?(time)
    bookings.where('start_time <= ? AND end_time >= ?', time, time).empty?
  end
end
