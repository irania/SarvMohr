class CreateYadavarenamazs < ActiveRecord::Migration
  def change
    create_table :yadavarenamazs do |t|
      t.integer :saat
      t.integer :min
      t.text :tozihat

      t.timestamps null: false
    end
  end
end
