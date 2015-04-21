class AddUserIdToRuzes < ActiveRecord::Migration
  def change
    add_column :ruzes, :user_id, :integer
  end
end
