class AddUserIdToManBoard < ActiveRecord::Migration
  def change
    add_column :man_boards, :user_id, :integer
  end
end
