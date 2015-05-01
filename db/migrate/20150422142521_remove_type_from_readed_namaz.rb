class RemoveTypeFromReadedNamaz < ActiveRecord::Migration
  def change
    remove_column :readed_namazs, :type, :string
  end
end
