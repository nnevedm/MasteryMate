class Offer < ApplicationRecord
  belongs_to :request
  has_many :reviews

  validates :content, presence: true, length: { minimum: 25 }
  validates :occurs_on, presence: true
  validates :time, presence: true, numericality: { only_integer: true }
end
