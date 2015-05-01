class AddLastModifiedColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_modified, :integer
  end
end
