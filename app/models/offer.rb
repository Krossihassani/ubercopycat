class Offer < ApplicationRecord
    validates :departing_from, :going_to, :car_model, :car_photo, presence: true
end
