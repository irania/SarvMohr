class AddNamazTypeColumnToReadedNamaz < ActiveRecord::Migration
  def change
    add_column :readed_namazs, :namaz_type, :integer
  end
end
