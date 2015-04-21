class CreateMohrs < ActiveRecord::Migration
  def change
    create_table :mohrs do |t|
      t.string :mohr_code

      t.timestamps null: false
    end
  end
end
