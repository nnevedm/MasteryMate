class RenameExpertisesToExperts < ActiveRecord::Migration[7.1]
  def change
    rename_table :expertises, :experts
  end
end
