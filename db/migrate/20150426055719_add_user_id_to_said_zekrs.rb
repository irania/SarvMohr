class AddUserIdToSaidZekrs < ActiveRecord::Migration
  def change
    add_column :said_zekrs, :user_id, :integer
  end
end
