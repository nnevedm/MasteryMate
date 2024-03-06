class Request < ApplicationRecord
  belongs_to :user
  belongs_to :expert
  has_many_attached :photos
end
