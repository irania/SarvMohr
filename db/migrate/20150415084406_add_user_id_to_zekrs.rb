class AddUserIdToZekrs < ActiveRecord::Migration
  def change
    add_column :zekrs, :user_id, :integer
  end
end
