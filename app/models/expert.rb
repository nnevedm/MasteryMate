class Expert < ApplicationRecord
  belongs_to :user
  has_many :expert_fields
  has_many :fields, through: :expert_fields
  has_many :requests
  has_many :reviews

  validates :description, presence: true, length: { minimum: 25 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :price_per_hour, presence: true, numericality: { only_integer: true }
end
