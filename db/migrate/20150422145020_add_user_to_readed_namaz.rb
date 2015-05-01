class AddUserToReadedNamaz < ActiveRecord::Migration
  def change
    add_column :readed_namazs, :user, :integer
  end
end
