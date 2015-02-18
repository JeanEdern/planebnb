class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :people
      t.date :check_in
      t.date :check_out
      t.references :plane, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :bookings, :planes
    add_foreign_key :bookings, :users
  end
end
