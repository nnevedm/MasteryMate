class RemoveOfferFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :offer_id, :references
  end
end
