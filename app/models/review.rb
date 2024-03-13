class Review < ApplicationRecord
  belongs_to :user
  belongs_to :expert

  validates :rating, presence: true
  validates :rating, comparison: { greater_than_or_equal_to: 1 }
  validates :rating, comparison: { less_than_or_equal_to: 5 }
  validates :comment, presence: true

  def create_date
    x = (Date.today - self.created_at.to_date).to_i
    if x == 0
      "Today"
    elsif x == 1
      "Yesterday"
    elsif x <= 30
      "#{x} days ago"
    else
      self.created_at.strftime("%B %d, %Y")
    end
  end
end
