class AddUserToSaidZekr < ActiveRecord::Migration
  def change
    add_column :said_zekrs, :user, :integer
  end
end
