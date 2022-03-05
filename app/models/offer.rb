class Offer < ApplicationRecord
    validates :price_per_km, :available_seats, :car_model, :car_photo, presence: true
end
