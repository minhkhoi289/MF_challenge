class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.string :name

      t.timestamps
    end
    add_index :seats, :name, unique: true
  end
end
