class CreateRuzes < ActiveRecord::Migration
  def change
    create_table :ruzes do |t|
      t.string :name
      t.text :tozihat
      t.integer :tedad

      t.timestamps null: false
    end
  end
end
