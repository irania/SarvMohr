class AddNamazTypeFromReadedNamaz < ActiveRecord::Migration
  def change
    add_column :readed_namazs, :namaz_type, :string
  end
end
