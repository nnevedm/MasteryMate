class Review < ApplicationRecord
  belongs_to :user
  belongs_to :expert

  validates :rating, presence: true
  validates :rating, comparison: { greater_than_or_equal_to: 1 }
  validates :rating, comparison: { less_than_or_equal_to: 5 }
  validates :comment, presence: true
end
