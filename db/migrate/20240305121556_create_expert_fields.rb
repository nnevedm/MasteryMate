class CreateExpertFields < ActiveRecord::Migration[7.1]
  def change
    create_table :expert_fields do |t|
      t.references :expert, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
