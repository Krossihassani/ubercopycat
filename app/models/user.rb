class User < ApplicationRecord
  # Include default devise modules. Others available are:
  
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :full_name, presence: true, uniqueness: true
  validates :postal_code, presence: true
  has_many :offers, dependent: :destroy
  has_many :bookings, :through => :offers
  has_one_attached :avatar, :dependent => :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
