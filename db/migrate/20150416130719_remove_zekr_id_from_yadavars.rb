class RemoveZekrIdFromYadavars < ActiveRecord::Migration
  def change
	remove_column  :yadavars, :zekr_id
  end
end
