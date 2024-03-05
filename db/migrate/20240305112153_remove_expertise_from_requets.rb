class RemoveExpertiseFromRequets < ActiveRecord::Migration[7.1]
  def change
    remove_column :requests, :expertise_id, :references
  end
end
