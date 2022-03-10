class User < ApplicationRecord
  # Include default devise modules. Others available are:
  
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :offers, dependent: :destroy
  has_many :bookings, :through => :offers
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
