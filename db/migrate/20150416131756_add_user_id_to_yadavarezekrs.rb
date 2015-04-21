class AddUserIdToYadavarezekrs < ActiveRecord::Migration
  def change
    add_column :yadavarezekrs, :user_id, :integer
  end
end
