class Expert < ApplicationRecord
  belongs_to :user
  has_many :expert_fields
  has_many :fields, through: :expert_fields
end
