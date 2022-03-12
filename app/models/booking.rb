class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :evaluations
  validates :departing_from, :going_to, presence: true
end
