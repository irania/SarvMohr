class AddZekrIdToYadavars < ActiveRecord::Migration
  def change
    add_column :yadavars, :zekr_id, :integer
  end
end
