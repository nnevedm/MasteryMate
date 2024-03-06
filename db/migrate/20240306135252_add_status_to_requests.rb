class AddStatusToRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :requests, :status, :string, default: "Pending"
  end
end
