class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :expert
  has_many :requests
  has_many :reviews
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :photo, presence: true
end
