class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :seat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :startTime
      t.datetime :endTime
      t.string :status

      t.timestamps
    end
  end
end
