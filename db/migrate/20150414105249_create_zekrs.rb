class CreateZekrs < ActiveRecord::Migration
  def change
    create_table :zekrs do |t|
      t.string :name
      t.text :tozihat
      t.integer :tedad

      t.timestamps null: false
    end
  end
end
