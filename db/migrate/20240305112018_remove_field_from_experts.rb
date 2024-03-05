class RemoveFieldFromExperts < ActiveRecord::Migration[7.1]
  def change
    remove_column :experts, :field, :string
  end
end
