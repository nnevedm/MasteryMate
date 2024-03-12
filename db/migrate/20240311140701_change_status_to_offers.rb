class ChangeStatusToOffers < ActiveRecord::Migration[7.1]
  def change
    change_column :offers, :status, :string, default: "Offer made"
  end
end
