class CreateYadavarezekrs < ActiveRecord::Migration
  def change
    create_table :yadavarezekrs do |t|
      t.integer :saat
      t.integer :min
      t.text :tozihat

      t.timestamps null: false
    end
  end
end
