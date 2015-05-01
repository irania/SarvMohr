class CreateSaidZekrs < ActiveRecord::Migration
  def change
    create_table :said_zekrs do |t|
      t.string :zekr_type
      t.integer :num_of_zekrs
      t.integer :start_time
      t.integer :date

      t.timestamps null: false
    end
  end
end
