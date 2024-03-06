class Offer < ApplicationRecord
  belongs_to :request
  has_many :reviews

  STATUS = ["Pending", "Declined", "Accepted"]
  validates :content, presence: true, length: { minimum: 25 }
  validates :occurs_on, presence: true
  validates :time, presence: true, numericality: { only_integer: true }
  validates :extra_costs, numericality: { only_integer: true }
  validates :reduction, numericality: { only_integer: true }
  validates :status, inclusion: { in: STATUS }
end
