class RemoveNamazIdFromYadavars < ActiveRecord::Migration
  def change
	remove_column  :yadavars, :namaz_id
  end
end
