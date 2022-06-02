class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :city
      t.integer :duration
      t.date :date
      t.references :car, null: false, foreign_key: { to_table: :cars }

      t.timestamps
    end
  end
end
