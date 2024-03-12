class Request < ApplicationRecord
  belongs_to :user
  belongs_to :expert
  has_one :offer
  has_many_attached :pictures
  has_many :messages

  STATUS = ["Pending", "Offer made", "Offer declined", "Offer accepted", "Canceled", "Rejected"]
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { minimum: 25 }
  validates :status, inclusion: { in: STATUS }

  def tag_color
    if self.status == "Pending"
      "yellow"
    elsif self.status == "Offer made"
      "blue"
    elsif self.status == "Offer accepted"
      "green"
    else
      "red"
    end
  end

  def update_date
    x = (Date.today - self.updated_at.to_date).to_i
    if x == 0
      "Today"
    elsif x == 1
      "Yesterday"
    elsif x <= 30
      "#{x} days ago"
    else
      self.updated_at.strftime("%B %d, %Y")
    end
  end

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
