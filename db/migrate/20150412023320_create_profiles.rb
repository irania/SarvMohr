class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :address
      t.string :mohr_code

      t.timestamps null: false
    end
  end
end
