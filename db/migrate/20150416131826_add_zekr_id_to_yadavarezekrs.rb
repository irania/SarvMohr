class AddZekrIdToYadavarezekrs < ActiveRecord::Migration
  def change
    add_column :yadavarezekrs, :zekr_id, :integer
  end
end
