class CreateExpertises < ActiveRecord::Migration[7.1]
  def change
    create_table :expertises do |t|
      t.string :field
      t.text :description
      t.integer :price_per_hour
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
