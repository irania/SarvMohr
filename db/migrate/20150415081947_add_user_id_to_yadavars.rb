class AddUserIdToYadavars < ActiveRecord::Migration
  def change
    add_column :yadavars, :user_id, :integer
  end
end
