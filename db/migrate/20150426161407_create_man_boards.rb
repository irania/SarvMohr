class CreateManBoards < ActiveRecord::Migration
  def change
    create_table :man_boards do |t|
      t.integer :sadaghe
      t.integer :komak_valedein
      t.integer :namaze_aval_vaght
      t.integer :doroogh
      t.integer :gheibat
      t.integer :tohmat
      t.integer :control_khashm

      t.timestamps null: false
    end
  end
end
