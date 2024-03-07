class Request < ApplicationRecord
  belongs_to :user
  belongs_to :expert
  has_many :offers
  has_many_attached :pictures

  STATUS = ["Pending", "Awaiting", "Accepted"]
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { minimum: 25 }
  validates :status, inclusion: { in: STATUS }
end
