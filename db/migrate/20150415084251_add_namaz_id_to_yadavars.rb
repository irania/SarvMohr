class AddNamazIdToYadavars < ActiveRecord::Migration
  def change
    add_column :yadavars, :namaz_id, :integer
  end
end
