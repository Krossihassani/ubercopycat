class Offer < ApplicationRecord
    belongs_to :user
    validates :price_per_km, :available_seats, :car_model, :car_photo, presence: true
    has_one_attached :car_photo
end
