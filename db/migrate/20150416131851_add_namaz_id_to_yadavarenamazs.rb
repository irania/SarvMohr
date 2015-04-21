class AddNamazIdToYadavarenamazs < ActiveRecord::Migration
  def change
    add_column :yadavarenamazs, :namaz_id, :integer
  end
end
