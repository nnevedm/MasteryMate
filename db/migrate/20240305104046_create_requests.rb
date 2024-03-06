class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.integer :estimated_time
      t.string :address
      t.string :status, default: "Pending"
      t.references :user, null: false, foreign_key: true
      t.references :expertise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
