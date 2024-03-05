class AddExpertToRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :requests, :expert, foreign_key: true
  end
end
