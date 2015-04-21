class CreateNamazs < ActiveRecord::Migration
  def change
    create_table :namazs do |t|
      t.integer :tedad_rokat
      t.string :name
      t.text :tozihat
      t.integer :tedad

      t.timestamps null: false
    end
  end
end
