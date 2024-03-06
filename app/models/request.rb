class Request < ApplicationRecord
  belongs_to :user
  belongs_to :expert
  has_many :offers

  STATUS = ["Pending", "Awaiting", "Accepted"]
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 25 }
  validates :status, inclusion: { in: STATUS }
  has_many_attached :photos
end
