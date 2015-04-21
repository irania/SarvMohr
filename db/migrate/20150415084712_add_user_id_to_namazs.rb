class AddUserIdToNamazs < ActiveRecord::Migration
  def change
    add_column :namazs, :user_id, :integer
  end
end
