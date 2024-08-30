class Booking < ApplicationRecord
  belongs_to :seat
  belongs_to :user

  enum: status: %i[booked cancelled expired]

  validate :already_booked?, on: :create
  validate :user_booked?, on: :create

  private

  def already_booked?
    if Booking.where(seat_id: seat_id, start_time: start_time..end_time).exists?
      errors.add(:seat_id, 'is already booked')
    end
  end

  def user_booked?
    if Booking.where(user_id: user_id, start_time: start_time..end_time).exists?
      errors.add(:user_id, 'is already booked')
    end
  end
end
