class AddExpertToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :expert, null: false, foreign_key: true
  end
end
