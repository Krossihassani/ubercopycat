class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.float :price_per_km
      t.integer :available_seats
      t.string :car_model
      t.string :car_photo

      t.timestamps
    end
  end
end
