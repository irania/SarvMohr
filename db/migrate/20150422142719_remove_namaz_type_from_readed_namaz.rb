class RemoveNamazTypeFromReadedNamaz < ActiveRecord::Migration
  def change
    remove_column :readed_namazs, :namaz_type, :integer
  end
end
