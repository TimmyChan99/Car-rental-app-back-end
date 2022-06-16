class AddCarRefToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :car, foreign_key: true
  end
end
