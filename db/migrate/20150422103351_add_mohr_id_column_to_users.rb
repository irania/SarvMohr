class AddMohrIdColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mohr_id, :integer
  end
end
