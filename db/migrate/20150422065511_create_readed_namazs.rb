class CreateReadedNamazs < ActiveRecord::Migration
  def change
    create_table :readed_namazs do |t|
      t.integer :date
      t.integer :start_time
      t.integer :period
      t.string :stateus
      t.string :type
      t.timestamps null: false
    end
  end
end
