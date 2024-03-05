class Request < ApplicationRecord
  belongs_to :user
  belongs_to :expert
  has_many :offers

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 25 }
end
