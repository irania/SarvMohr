class AddUserIdToYadavarenamazs < ActiveRecord::Migration
  def change
    add_column :yadavarenamazs, :user_id, :integer
  end
end
