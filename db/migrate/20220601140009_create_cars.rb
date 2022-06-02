class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.boolean :reserved
      t.text :description
      t.decimal :price
      
      t.timestamps
    end
  end
end
