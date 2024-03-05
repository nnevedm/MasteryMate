class CreateFields < ActiveRecord::Migration[7.1]
  def change
    create_table :fields do |t|
      t.string :expertise

      t.timestamps
    end
  end
end
