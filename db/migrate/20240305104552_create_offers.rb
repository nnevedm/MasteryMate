class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.text :content
      t.date :occurs_on
      t.integer :time
      t.integer :extra_costs
      t.integer :reduction
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
